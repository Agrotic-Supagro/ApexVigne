import 'dart:convert';
import 'package:apex_vigne/app_config.dart';
import 'package:apex_vigne/pages/login/login.page.dart';
import 'package:apex_vigne/services/isar.service.dart';
import 'package:apex_vigne/services/navigation.service.dart';
import 'package:apex_vigne/services/parcels_api.service.dart';
import 'package:apex_vigne/services/sessions_api.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:http/http.dart' as http;
import 'package:material_symbols_icons/symbols.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthenticationService {
  static final AuthenticationService _instance =
      AuthenticationService._internal();
  ValueNotifier<bool> authenticationState = ValueNotifier(false);
  ValueNotifier<bool> registerState = ValueNotifier(false);
  ValueNotifier<bool> isOnlineState = ValueNotifier(true);

  factory AuthenticationService() {
    return _instance;
  }

  AuthenticationService._internal();

  Future<String> get token async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      authenticationState.value = false;
      throw Exception('No token');
    }
    return token;
  }

  /* Methods auth state */
  Future<void> checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null) {
      authenticationState.value = true;
    }
  }

  void displayStateSnackBar(BuildContext context, bool switchState) async {
    if (context.mounted && isOnlineState.value != switchState) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            switchState
                ? AppLocalizations.of(context)!.infoConnected
                : AppLocalizations.of(context)!.infoErrorDisconnected,
          ),
          duration: const Duration(seconds: 2),
          backgroundColor:
              switchState ? Colors.green.shade700 : Colors.red.shade700,
        ),
      );
    }
  }

  /* Check connection */
  Future<bool> checkConnection(BuildContext context) async {
    final url = Uri.parse(AppConfig.apiBaseUrl);

    try {
      final response = await http.get(url, headers: {
        'Authorization': 'Bearer ${await token}',
        'Content-Type': 'application/json',
      }).timeout(const Duration(seconds: 20), onTimeout: () {
        return http.Response(
          json.encode({'token': null}),
          408,
        );
      });
      if (response.statusCode == 200) {
        displayStateSnackBar(context, true);
        await syncData(context);
        isOnlineState.value = true;
        return true;
      } else {
        displayStateSnackBar(context, false);
        isOnlineState.value = false;
        return false;
      }
    } catch (e) {
      debugPrint('Error: $e');
      displayStateSnackBar(context, false);
      isOnlineState.value = false;
      return false;
    }
  }

  Future<void> deleteAccount(BuildContext context) async {
    final url = Uri.parse('${AppConfig.apiBaseUrl}/delete-account');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${await token}',
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(AppLocalizations.of(context)!.titleDeleteAccountConfirmation),
            content: Text(AppLocalizations.of(context)!.messageDeleteAccountConfirmation),
            actions: [
              TextButton(
                onPressed: () {
                  logout(() {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ));
                  });
                },
                child: Text(AppLocalizations.of(context)!.actionClose),
              ),
            ],
          );
        },
      );
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Erreur lors de la demande de suppression."//AppLocalizations.of(context)!.infoErrorDisconnected,
            ),
            duration: const Duration(seconds: 5),
            backgroundColor: Colors.red.shade700,
          ),
        );
      }
      throw Exception('Failed to retrieve user data : ${response.body}');
    }
  }

  Future<void> syncData(BuildContext context) async {
    /* If isOnlineState already true, no need to sync */
    if (!context.mounted || isOnlineState.value) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Symbols.sync, color: Colors.white),
            Expanded(child: Text(AppLocalizations.of(context)!.infoSyncData)),
          ],
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );

    final offlineParcels = await IsarService().offlineParcels;
    final offlineSessions = await IsarService().offlineSessions;

    if (offlineParcels.isNotEmpty) {
      for (final parcel in offlineParcels) {
        await ParcelsApiService().addParcel(parcel, offlineParcel: true);
      }
    }
    if (offlineSessions.isNotEmpty) {
      for (final session in offlineSessions) {
        await SessionsApiService().addSession(session, offlineSession: true);
      }
    }

    await getCurrentUserProfile();
    await ParcelsApiService().getAuthorizedParcels();
    await SessionsApiService().getAuthorizedSessions();
  }

  Future<String?> login(LoginData data) async {
    final response = await http
        .post(Uri.parse('${AppConfig.apiBaseUrl}/login'),
            headers: {"Content-Type": "application/json"},
            body: json.encode({
              'email': data.name,
              'password': data.password,
            }))
        .timeout(const Duration(seconds: 20), onTimeout: () {
      return http.Response(
        json.encode({'token': null}),
        408,
      );
    });
    if (response.statusCode == 200) {
      final Map<String, dynamic> res = json.decode(response.body);
      if (res['token'] == null) {
        return AppLocalizations.of(
          NavigationService.navigatorKey.currentContext!,
        )!
            .infoInvalidEmailOrPassword;
      }
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('token', res['token']);
      authenticationState.value = true;
      return null;
    } else {
      return AppLocalizations.of(
        NavigationService.navigatorKey.currentContext!,
      )!
          .infoErrorLogin;
    }
  }

  Future<void> logout(VoidCallback onSuccess) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      if (token != null) {
        authenticationState.value = false;
        prefs.remove('token');
        onSuccess();
      }
    } catch (e) {
      throw Exception('Error during logout: $e');
    }
  }

  Future<String?> recoverPassword(String name) async {
    final response = await http
        .post(Uri.parse('${AppConfig.apiBaseUrl}/recover-password'),
            headers: {"Content-Type": "application/json"},
            body: json.encode({'email': name}))
        .timeout(const Duration(seconds: 20), onTimeout: () {
      return http.Response(
        json.encode({'message': 'timeout'}),
        408,
      );
    });
    if (response.statusCode == 200) {
      return null;
    } else {
      return AppLocalizations.of(
        NavigationService.navigatorKey.currentContext!,
      )!.infoErrorRecoverPassword;
    }
  }

  Future<String?> confirmRecoverPassword(String code, LoginData data) async {
    final response = await http
        .post(Uri.parse('${AppConfig.apiBaseUrl}/confirm-recover-password'),
            headers: {"Content-Type": "application/json"},
            body: json.encode({
              'code': code,
              'email': data.name,
              'password': data.password,
            }))
        .timeout(const Duration(seconds: 20), onTimeout: () {
      return http.Response(
        json.encode({'message': 'timeout'}),
        408,
      );
    });

    if (response.statusCode == 200) {
      return null;
    } else {
      return AppLocalizations.of(
        NavigationService.navigatorKey.currentContext!,
      )!.infoErrorConfirmRecoverPassword;
    }
  }

  Future<void> getCurrentUserProfile() async {
    final url = Uri.parse('${AppConfig.apiBaseUrl}/me');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${await token}',
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      final dynamic data = json.decode(response.body);
      final List<dynamic> listData = [];
      listData.add(data);
      final prefs = await SharedPreferences.getInstance();
      final nbObsMin = listData[0]['nbObsMin'] ?? 50;
      prefs.setInt('nbObsMin', nbObsMin);
      await IsarService().saveDataServer('me', listData);
    } else {
      throw Exception('Failed to retrieve user data : ${response.body}');
    }
  }

  Future<String?> signup(SignupData data) async {
    var jsonData = {
      'email': data.name,
      'password': data.password,
    };
    data.additionalSignupData?.forEach((key, value) {
      jsonData[key] = value;
    });
    final response = await http
        .post(Uri.parse('${AppConfig.apiBaseUrl}/signup'),
            headers: {"Content-Type": "application/json"},
            body: json.encode(jsonData))
        .timeout(const Duration(seconds: 20), onTimeout: () {
      return http.Response(
        json.encode({'message': 'timeout'}),
        408,
      );
    });
    final Map<String, dynamic> res = json.decode(response.body);
    if (response.statusCode == 200) {
      if (res['token'] == null) {
        return AppLocalizations.of(
          NavigationService.navigatorKey.currentContext!,
        )!
            .infoInvalidEmailOrPassword;
      }
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('token', res['token']);
      authenticationState.value = true;
      return null;
    } else {
      return res['message'];
    }
  }
}
