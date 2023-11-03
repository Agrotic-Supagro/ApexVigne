import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:http/http.dart' as http;
import 'package:apex_vigne/models/user.model.dart';
import 'package:apex_vigne/constants.dart';
import 'package:apex_vigne/services/storage.service.dart';


class AuthenticationService {
  final userStorage = StorageService<User>('user', (json) => User.fromJson(json));
  ValueNotifier<bool> authenticationState = ValueNotifier(false);
  ValueNotifier<bool> registerState = ValueNotifier(false);

  /* Methods auth state */
  Future<void> checkToken() async {
    final User? user = await userStorage.getData();
    String? token;

    if (user != null) {
      token = user.token;
    }
    if (token != null) {
      authenticationState.value = true;
    }
  }

  Future<String?> login(LoginData data) async {
    final response = await http.post(Uri.parse('$APEX_VIGNE_API_URL/login.php'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        'email': data.name,
        'mot_de_passe': data.password,
      }));

    if (response.statusCode == 200) {
      final Map<String, dynamic> res = json.decode(response.body);
      if (res['jwt'] == null) {
        return 'Email ou mot de passe invalide';
      }

      final User dataUser = User(
        id: res['data']['id_utilisateur'],
        firstname: res['data']['prenom'],
        lastname: res['data']['nom'],
        email: res['data']['email'].toLowerCase(),
        structure: res['data']['structure'],
        creationDate: 0,
        updateDate: 0,
        token: res['jwt'],
        ifvModel: 0,
        state: 0,
      );

      await userStorage.storeData(dataUser);
      authenticationState.value = true;
      final User? user = await userStorage.getData();
      if (user != null) {
        debugPrint(json.encode(user));
      }
      return null;
    } else {
      return 'Erreur de connexion';
    }
  }

  Future<void> logout(VoidCallback onSuccess) async {
    try {
      final User? user = await userStorage.getData();
      String? token;

      if (user != null) {
        token = user.token;
      }
      if (token != null) {
        await userStorage.clearData();
        authenticationState.value = false;
        onSuccess();
      }
    } catch (e) {
      throw Exception('Error during logout: $e');
    }
  }
}
