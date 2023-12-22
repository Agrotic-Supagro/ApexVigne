import 'dart:convert';
import 'package:apex_vigne/collections/session.collection.dart';
import 'package:apex_vigne/services/auth.service.dart';
import 'package:apex_vigne/services/isar.service.dart';
import 'package:http/http.dart' as http;
import 'package:apex_vigne/constants.dart';

class SessionsApiService {
  final url = Uri.parse('$apiBaseUrl/sessions');
  Future<Map<String, String>> get headers async => {
    'Authorization': 'Bearer ${await AuthenticationService().token}',
    'Content-Type': 'application/json',
  };

  Future<void> getAuthorizedSessions() async {
    final response = await http.get(url, headers: await headers);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      await IsarService().saveData('sessions', data);
    } else {
      throw Exception('Failed to retrieve user data');
    }
  }

  Future<void> addSession(Session session) async {
    final response = await http.post(
      url,
      headers: await headers,
      body: jsonEncode(<String, dynamic>{
        'sessionAt': session.sessionAt,
        'apexFullGrowth': session.apexFullGrowth,
        'apexSlowerGrowth': session.apexSlowerGrowth,
        'apexStuntedGrowth': session.apexStuntedGrowth,
        'parcelId': session.parcelId,
      })
    );

    if (response.statusCode == 201) {
      print(json.decode(response.body));
      session.id = json.decode(response.body)['id'];
      await IsarService().saveSession(session);
    } else {
        throw Exception('Failed to add session');
    }
  }
}
