import 'package:flutter/foundation.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../constants.dart';

class AuthenticationService {
  ValueNotifier<bool> authenticationState = ValueNotifier(false);
  ValueNotifier<bool> registerState = ValueNotifier(false);

  Future<void> checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(TOKEN_KEY);
    if (token != null) {
      authenticationState.value = true;
    }
  }

  Future<String?> login(LoginData data) async {
    final response =
        await http.post(Uri.parse('$AUTH_SERVER_ADDRESS/login.php'), body: {
      'email': data.name,
      'mot_de_passe': data.password,
    });
    debugPrint(response.body + response.statusCode.toString());
    if (response.statusCode == 200) {
      final Map<String, dynamic> res = json.decode(response.body);

        if (res['jwt'] == null) {
          return 'Email ou mot de passe incorrect';
        }
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(TOKEN_KEY, res['jwt']);


        final dataUser = {
          'id_utilisateur': res['data']['id_utilisateur'],
          'prenom': res['data']['prenom'],
          'nom': res['data']['nom'],
          'email': res['data']['email'].toLowerCase(),
          'mot_de_passe': res['mot_de_passe'],
          'structure': res['data']['structure'],
        };

        await storeUserData(dataUser);

        authenticationState.value = true;
    } else {
      return 'Erreur de connexion';
    }
    return null;
  }

  Future<String?> register(SignupData data) async {
    // await storeUserData(data);

    final response = await http.post(
      Uri.parse('$AUTH_SERVER_ADDRESS/create_user.php'),
      body: {
        'prenom': data.additionalSignupData!['firstName'],
        'nom': data.additionalSignupData!['lastName'],
        'email': data.name,
        'mot_de_passe': data.password,
        'structure': data.additionalSignupData!['structure'],
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> res = json.decode(response.body);
      if (res['status']) {
        registerState.value = true;
      } else {
        throw Exception('Erreur lors de l\'inscription');
      }
    } else {
      throw Exception('Erreur lors de l\'inscription');
    }
  }

  Future<void> resetPassword(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$AUTH_SERVER_ADDRESS/reset_password.php'),
      body: data,
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> res = json.decode(response.body);
      // handle response
    } else {
      throw Exception('Erreur lors de la réinitialisation du mot de passe');
    }
  }

  Future<void> changePassword(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$AUTH_SERVER_ADDRESS/change_password.php'),
      body: data,
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> res = json.decode(response.body);
      // handle response
    } else {
      throw Exception('Erreur lors de la modification du mot de passe');
    }
  }

  Future<void> storeUserData(Map<String, dynamic> userData) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('id_utilisateur', userData['id_utilisateur']);
      await prefs.setString('prenom', userData['prenom']);
      await prefs.setString('nom', userData['nom']);
      await prefs.setString('email', userData['email']);
      await prefs.setString('mot_de_passe', userData['mot_de_passe']);
      await prefs.setString('structure', userData['structure']);
    } catch (e) {
      throw Exception(
          'Erreur lors de la sauvegarde des données utilisateur : $e');
    }
  }

  Future<Map<String, dynamic>> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = <String, dynamic>{};

    try {
      userData['id_utilisateur'] = prefs.getString('id_utilisateur');
      userData['prenom'] = prefs.getString('prenom');
      userData['nom'] = prefs.getString('nom');
      userData['email'] = prefs.getString('email');
      userData['mot_de_passe'] = prefs.getString('mot_de_passe');
      userData['structure'] = prefs.getString('structure');
    } catch (e) {
      throw Exception(
          'Erreur lors de la récupération des données utilisateur : $e');
    }

    return userData;
  }

  Future<void> clearUserData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('id_utilisateur');
      await prefs.remove('prenom');
      await prefs.remove('nom');
      await prefs.remove('email');
      await prefs.remove('mot_de_passe');
      await prefs.remove('structure');
    } catch (e) {
      throw Exception(
          'Erreur lors de la suppression des données utilisateur : $e');
    }
  }

  Future<void> updateJWT(Map<String, dynamic> jwtData) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('jwt', jwtData['jwt']);
      await prefs.setString('email', jwtData['email']);
      await prefs.setString('mot_de_passe', jwtData['mot_de_passe']);
    } catch (e) {
      throw Exception('Erreur lors de la mise à jour du jeton JWT : $e');
    }
  }

  Future<Map<String, dynamic>> getJWT() async {
    final prefs = await SharedPreferences.getInstance();
    final jwtData = <String, dynamic>{};

    try {
      jwtData['jwt'] = prefs.getString('jwt');
      jwtData['email'] = prefs.getString('email');
      jwtData['mot_de_passe'] = prefs.getString('mot_de_passe');
    } catch (e) {
      throw Exception('Erreur lors de la récupération du jeton JWT : $e');
    }

    return jwtData;
  }
}
