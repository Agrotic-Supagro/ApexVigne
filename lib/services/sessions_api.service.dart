import 'dart:convert';
import 'package:apex_vigne/collections/session.collection.dart';
import 'package:apex_vigne/services/isar.service.dart';
import 'package:http/http.dart' as http;
import 'package:apex_vigne/constants.dart';
import 'package:apex_vigne/services/shared_prefs.service.dart';

import 'package:apex_vigne/models/user.model.dart';

class SessionsApiService {
  final userStorage = SharedPrefsService<UserModel>('user', (json) => UserModel.fromJson(json));

  Future<void> getAuthorizedSessions() async {
    final UserModel? user = await userStorage.getData();
    if (user == null) {
      throw Exception('User error');
    }
    final url = Uri.parse('$apiBaseUrl/sessions');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      IsarService isarService = IsarService();
      await isarService.saveData('sessions', data);
    } else {
      throw Exception('Failed to retrieve user data');
    }
  }

  Future<void> addSession(Session session) async {
    final url = Uri.parse('$apiBaseUrl/sessions');

    print(jsonEncode(session));
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(session)
    );

    if (response.statusCode == 200) {
    } else {
      throw Exception('Failed to add session');
    }
}
}
