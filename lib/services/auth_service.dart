import 'package:apex_vigne/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../constants.dart';

class AuthenticationService {
  ValueNotifier<bool> authenticationState = ValueNotifier(false);
  ValueNotifier<bool> registerState = ValueNotifier(false);

  /* Methods auth state */
  Future<void> checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('user');
    if (userJson != null) {
      final user = User.fromJson(jsonDecode(userJson));
      final token = user.token;

      if (token != null) {
        authenticationState.value = true;
      }
    }
  }

  Future<String?> login(LoginData data) async {
    final response = await http.post(Uri.parse('$AUTH_SERVER_ADDRESS/login.php'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        'email': data.name,
        'mot_de_passe': data.password,
      }));

    if (response.statusCode == 200) {
      final Map<String, dynamic> res = json.decode(response.body);

      if (res['jwt'] == null) {
        return null; // Échec de la connexion
      }

      final User dataUser = User(
        id: res['data']['id_utilisateur'],
        firstname: res['data']['prenom'],
        lastname: res['data']['nom'],
        email: res['data']['email'].toLowerCase(),
        structure: res['data']['structure'],
        dateCreation: 0,
        dateMaj: 0,
        token: res['jwt'],
        modelIfv: 0,
        state: 0,
      );

      await storeUserData(dataUser);
      authenticationState.value = true;
      final User? user = await getUserData();
      if (user != null) {
        debugPrint(json.encode(user));
      }
      return null;
    } else {
      return 'Errer de connexion';
    }
  }

  Future<void> logout(VoidCallback onSuccess) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userJson = prefs.getString('user');
      if (userJson == null) {
        throw Exception('User error');
      }
        final user = User.fromJson(jsonDecode(userJson));
        final token = user.token;

      if (token != null) {
        await clearUserData();
        authenticationState.value = false;
        onSuccess();
      }
    } catch (e) {
      throw Exception('Error during logout: $e');
    }
  }

  /* Storage */
  Future<void> storeUserData(User userData) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userJson = jsonEncode(userData.toJson());
      await prefs.setString('user', userJson);
    } catch (e) {
      throw Exception('Erreur lors de la sauvegarde des données utilisateur : $e');
    }
  }

  Future<User?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();

    try {
      final userJson = prefs.getString('user');
      if (userJson != null) {
        final userData = User.fromJson(jsonDecode(userJson));
        return userData;
      }
    } catch (e) {
      throw Exception('Erreur lors de la récupération des données utilisateur : $e');
    }

    return null;
  }


  Future<void> clearUserData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('user');
    } catch (e) {
      throw Exception('Error clearing user data: $e');
    }
  }
}
