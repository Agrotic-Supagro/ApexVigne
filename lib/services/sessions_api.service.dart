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
      await IsarService().saveDataServer('sessions', data);
    } else {
      throw Exception('Failed to retrieve user data');
    }
  }

  Future<void> updateSession(Session session) async {
    final response = await http.put(Uri.parse('$url/${session.id}'),
        headers: await headers,
        body: jsonEncode(<String, dynamic>{
          'sessionAt': session.sessionAt,
          'apexFullGrowth': session.apexFullGrowth,
          'apexSlowerGrowth': session.apexSlowerGrowth,
          'apexStuntedGrowth': session.apexStuntedGrowth,
          'stadePhenoId': session.stadePhenoId,
          'notes': session.notes,
        }));

    if (response.statusCode == 204) {
      await IsarService().updateSession(session);
    } else {
      throw Exception('Failed to update session');
    }
  }

  Future<void> addSession(Session session,
      {bool offlineSession = false}) async {
    final response = await http.post(url,
        headers: await headers,
        body: jsonEncode(<String, dynamic>{
          'sessionAt': session.sessionAt,
          'apexFullGrowth': session.apexFullGrowth,
          'apexSlowerGrowth': session.apexSlowerGrowth,
          'apexStuntedGrowth': session.apexStuntedGrowth,
          'parcelId': session.parcelId,
          'notes': session.notes,
          'deviceHardware': session.deviceHardware,
          'deviceSoftware': session.deviceSoftware,
          'stadePhenoId': session.stadePhenoId,
          'inField': session.inField,
          'latitude': session.latitude,
          'longitude': session.longitude,
        }));

    if (response.statusCode == 201) {
      session.id = json.decode(response.body)['id'];
      if (!offlineSession) {
        await IsarService().saveSession(session);
      }
    } else {
      throw Exception('Failed to add session');
    }
  }
}
