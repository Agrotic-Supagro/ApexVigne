import 'dart:convert';
import 'package:apex_vigne/collections/session.collection.dart';
import 'package:apex_vigne/services/auth.service.dart';
import 'package:apex_vigne/services/isar.service.dart';
import 'package:http/http.dart' as http;
import 'package:apex_vigne/constants.dart';

class SessionsApiService {
  final url = Uri.parse('$apiBaseUrl/parcels');
  Future<Map<String, String>> get headers async => {
    'Authorization': 'Bearer ${await AuthenticationService().token}',
    'Content-Type': 'application/json',
  };

  Future<void> getAuthorizedSessions() async {
    final url = Uri.parse('$apiBaseUrl/sessions');

    final response = await http.get(url, headers: await headers);

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
      headers: await headers,
      body: jsonEncode(session)
    );

    if (response.statusCode == 200) {
    } else {
      throw Exception('Failed to add session');
    }
}
}
