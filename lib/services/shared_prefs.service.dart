import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService<T> {
  final String _key;
  final T Function(Map<String, dynamic>) fromJson; // Fonction pour désérialiser

  SharedPrefsService(this._key, this.fromJson);

  Future<void> storeData(T data) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final dataJson = jsonEncode(data);
      await prefs.setString(_key, dataJson);
    } catch (e) {
      throw Exception('Erreur lors de la sauvegarde des données : $e');
    }
  }

  Future<T?> getData() async {
    final prefs = await SharedPreferences.getInstance();
    final dataJson = prefs.getString(_key);
    if (dataJson != null) {
      return fromJson(json.decode(dataJson));
    }
    return null;
  }

  Future<void> clearData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_key);
    } catch (e) {
      throw Exception('Erreur lors de la suppression des données : $e');
    }
  }
}
