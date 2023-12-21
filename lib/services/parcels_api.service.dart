import 'dart:convert';
import 'package:apex_vigne/collections/parcel.collection.dart';
import 'package:apex_vigne/services/auth.service.dart';
import 'package:apex_vigne/services/isar.service.dart';
import 'package:http/http.dart' as http;
import 'package:apex_vigne/constants.dart';

class ParcelsApiService {
  final url = Uri.parse('$apiBaseUrl/parcels');
  Future<Map<String, String>> get headers async => {
    'Authorization': 'Bearer ${await AuthenticationService().token}',
    'Content-Type': 'application/json',
  };

  Future<void> getAuthorizedParcels() async {
    final response = await http.get(url, headers: await headers);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      IsarService isarService = IsarService();
      await isarService.saveData('parcels', data);
    } else {
      throw Exception('Failed to retrieve user data');
    }
  }

  Future<void> addParcel(Parcel parcel) async {
    // Map<String, dynamic> parcelMap = parcel.
    final response = await http.post(
      url,
      headers: await headers,
      body: jsonEncode(parcel)
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      IsarService isarService = IsarService();
      await isarService.saveData('parcels', [data]);
    } else {
      throw Exception('Failed to add parcel');
    }
  }
}
