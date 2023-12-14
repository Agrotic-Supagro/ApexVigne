import 'package:apex_vigne/collections/session.collection.dart';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:apex_vigne/collections/parcel.collection.dart';

class IsarService {
  static IsarService? _instance;
  static IsarService get instance {
    _instance ??= IsarService();
    return _instance!;
  }


  late Future<Isar> db;
  IsarService() {
    db = _openIsar();
  }

  Future<Isar> _openIsar() async {
    if (Isar.getInstance() == null) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
          [ParcelSchema, SessionSchema],
          inspector: !kReleaseMode, directory: dir.path);
    }

    return Future.value(Isar.getInstance());
  }

  Future<List<Parcel>> getAllParcels() async {
    final Isar isar = await db;
    return await isar.parcels.where().findAll();
  }

  Future<List<Session>> getAllSessions() async {
    final Isar isar = await db;
    return await isar.sessions.where().findAll();
  }

  Future<List<Parcel>> get allParcels async => getAllParcels();
  Future<List<Session>> get allSessions async => getAllSessions();
}

Future<void> saveData(String table, Map<String, dynamic> res) async {
  final Isar isar = await IsarService.instance.db;
  final List<Map<String, dynamic>> dataList =
      (res['data'] as List).cast<Map<String, dynamic>>();
  await isar.writeTxn(() async {
    if (table == 'parcelle') {
      await isar.parcels.importJson(dataList);
    } else if (table == 'session') {
      await isar.sessions.importJson(dataList);
    }
  });
}

Future<void> deleteAllData() async {
  final Isar isar = await IsarService.instance.db;
  await isar.writeTxn(() async {
      await isar.parcels.where().deleteAll();
      await isar.sessions.where().deleteAll();
  });
}
