import 'dart:convert';
import 'package:apex_vigne/constants_language.dart';
import 'package:apex_vigne/services/isar.service.dart';
import 'package:apex_vigne/services/parcels_api.service.dart';
import 'package:apex_vigne/services/sessions_api.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:http/http.dart' as http;
import 'package:apex_vigne/constants.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
          content: Text(switchState ? infoConnected : infoErrorDisconnected),
          duration: const Duration(seconds: 2),
          backgroundColor:
              switchState ? Colors.green.shade700 : Colors.red.shade700,
        ),
      );
    }
  }

  /* Check connection */
  Future<bool> checkConnection(BuildContext context) async {
    final url = Uri.parse(apiBaseUrl);

    try {
      final response = await http.get(url, headers: {
        'Authorization': 'Bearer ${await token}',
        'Content-Type': 'application/json',
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

  Future<void> syncData(BuildContext context) async {
    /* If isOnlineState already true, no need to sync */
    if (!context.mounted || isOnlineState.value) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Symbols.sync, color: Colors.white),
            Expanded(child: Text(infoSyncData)),
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
    final response = await http.post(Uri.parse('$apiBaseUrl/login'),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          'email': data.name,
          'password': data.password,
        }));

    if (response.statusCode == 200) {
      final Map<String, dynamic> res = json.decode(response.body);
      if (res['token'] == null) {
        return infoInvalidEmailOrPassword;
      }
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('token', res['token']);
      authenticationState.value = true;
      return null;
    } else {
      return infoErrorLogin;
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

  Future<void> getCurrentUserProfile() async {
    final url = Uri.parse('$apiBaseUrl/me');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${await token}',
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      final dynamic data = json.decode(response.body);
      final List<dynamic> listData = [];
      listData.add(data);
      await IsarService().saveDataServer('me', listData);
    } else {
      throw Exception('Failed to retrieve user data');
    }
  }
}
