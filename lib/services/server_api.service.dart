import 'dart:convert';
import 'package:apex_vigne/services/storage.service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:apex_vigne/constants.dart';
import 'package:apex_vigne/models/user.model.dart';
import 'package:apex_vigne/models/parcel.model.dart';

class ServerApiService {
  final userStorage = StorageService<User>('user', (json) => User.fromJson(json));

  // Retrieve User data
  Future<List<Parcel>> retrieveUserData(String table) async {
    final User? user = await userStorage.getData();
    final url = Uri.parse('$APEX_VIGNE_API_URL/retrieve_data.php');
    if (user == null) {
      throw Exception('User error');
    }
    final body = {
      "table": table,
      "idUser": user.id
    };

    final response = await http.post(url, body: json.encode(body));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      final List<Parcel> parcels = data.map((json) => Parcel.fromJson(json)).toList();
      return parcels;
    } else {
      throw Exception('Failed to retrieve user data');
    }
  }
}
