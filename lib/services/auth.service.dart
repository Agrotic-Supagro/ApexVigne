import 'dart:convert';
import 'package:apex_vigne/services/isar.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:http/http.dart' as http;
import 'package:apex_vigne/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationService {
  ValueNotifier<bool> authenticationState = ValueNotifier(false);
  ValueNotifier<bool> registerState = ValueNotifier(false);
  ValueNotifier<bool> isOnline = ValueNotifier(false);

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

  /* Check connection */
  Future<bool> checkConnection(BuildContext context) async {
    final url = Uri.parse(apiBaseUrl);

    try {
      final response = await http.get(url, headers: {
        'Authorization': 'Bearer ${await token}',
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 200) {
        isOnline.value = true;
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Vous êtes en ligne'),
            ),
          );
        }
        return true;
      } else {
        isOnline.value = false;
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Vous n\'êtes hors-ligne'),
            ),
          );
        }
        return false;
      }
    } catch (e) {
      debugPrint('Error: $e');
      return false;
    }
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
        return 'Email ou mot de passe invalide';
      }
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('token', res['token']);
      authenticationState.value = true;
      return null;
    } else {
      return 'Erreur de connexion';
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
      IsarService isarService = IsarService();
      await isarService.saveData('me', listData);
    } else {
      throw Exception('Failed to retrieve user data');
    }
  }
}
