import 'dart:convert';
import 'package:apex_vigne/models/parcel.model.dart';
import 'package:apex_vigne/models/session_stade.model.dart';
import 'package:apex_vigne/services/isar.service.dart';
import 'package:http/http.dart' as http;
import 'package:apex_vigne/constants.dart';
import 'package:apex_vigne/services/shared_prefs.service.dart';

import 'package:apex_vigne/models/comment.model.dart';
import 'package:apex_vigne/models/session.model.dart';
import 'package:apex_vigne/models/user_parcel.model.dart';
import 'package:apex_vigne/models/user.model.dart';

class ServerApiService {
  final userStorage = SharedPrefsService<UserModel>('user', (json) => UserModel.fromJson(json));

  // Send a mail
  static Future<void> sendMail(String email, String corpsEmail) async {
    final url = Uri.parse('$APEX_VIGNE_API_URL/contact.php');
    final body = {
      "email": email,
      "corps_email": corpsEmail,
    };

    final response = await http.post(url, body: json.encode(body));

    // Handle the response
  }

  // Send local data
  static Future<void> sendLocalData(String email, String method, int idParcelle, int idUser, String userName) async {
    final url = Uri.parse('$APEX_VIGNE_API_URL/send_data.php');
    final body = {
      "email": email,
      "method": method,
      "idParcelle": idParcelle,
      "idUser": idUser,
      "userName": userName,
    };

    final response = await http.post(url, body: json.encode(body));

    // Handle the response
  }

  // Send all local data
  static Future<void> sendAllLocalData(
      String user, String table, List<Map<String, dynamic>> data) async {
    final url = Uri.parse('$APEX_VIGNE_API_URL/send_all_data.php');
    final body = {
      "user": user,
      "table": table,
      "data": data,
    };

    final response = await http.post(url, body: json.encode(body));

    // Handle the response
  }

  // Retrieve User data
  Future<void> retrieveData(String table) async {
    final UserModel? user = await userStorage.getData();
    final url = Uri.parse('$APEX_VIGNE_API_URL/retrieve_data.php');
    if (user == null) {
      throw Exception('User error');
    }
    final body = {"table": table, "idUser": user.id};

    final response = await http.post(url, body: json.encode(body));

    if (response.statusCode == 200) {
      final Map<String, dynamic> res = json.decode(response.body);
      await saveData(table, res);
    } else {
      throw Exception('Failed to retrieve user data');
    }
  }

  List<dynamic> determineTable(String table, List<dynamic> data) {
    switch (table) {
      case 'parcelle':
        return data.map((json) => ParcelModel.fromJson(json)).toList();
      case 'utilisateur_parcelle':
        return data.map((json) => UserParcelModel.fromJson(json)).toList();
      case 'session':
        return data.map((json) => SessionModel.fromJson(json)).toList();
      case 'commentaire':
        return data.map((json) => CommentModel.fromJson(json)).toList();
      case 'session_stadepheno':
        return data.map((json) => SessionStadePhenoModel.fromJson(json)).toList();
      default:
        throw Exception('Error');
    }
  }

  // Share a parcel
  static Future<void> shareParcel(int idOwner, String nomUser, int idParcelle, String nomParcelle, String email) async {
    final url = Uri.parse('$APEX_VIGNE_API_URL/share_parcelle.php');
    final body = {
      "idOwner": idOwner,
      "nomUser": nomUser,
      "idParcelle": idParcelle,
      "nomParcelle": nomParcelle,
      "email": email,
    };

    final response = await http.post(url, body: json.encode(body));

    // Handle the response
  }

  // Get shared parcel
  static Future<Map<String, dynamic>> getSharedParcel(int idUser) async {
    final url = Uri.parse('$APEX_VIGNE_API_URL/sync_parcelle_shared.php');
    final body = {
      "idUser": idUser,
    };

    final response = await http.post(url, body: json.encode(body));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to retrieve shared parcel data');
    }
  }

  // Get shared data
  static Future<Map<String, dynamic>> getSharedData(
      String table, List<Map<String, dynamic>> data) async {
    final url = Uri.parse('$APEX_VIGNE_API_URL/sync_data.php');
    final body = {
      "table": table,
      "data": data,
    };

    final response = await http.post(url, body: json.encode(body));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to retrieve shared data');
    }
  }

  // Update stade pheno
  static Future<Map<String, dynamic>> updateStadePheno() async {
    final url = Uri.parse('$APEX_VIGNE_API_URL/update_stade_pheno.php');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to update stade pheno data');
    }
  }
}
