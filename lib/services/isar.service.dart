import 'package:apex_vigne/collections/session.collection.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:apex_vigne/collections/parcel.collection.dart';

class IsarService {
  static final IsarService _instance = IsarService._internal();

  late final Isar isar;

  factory IsarService() {
    return _instance;
  }

  IsarService._internal();

  Future<void> initIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [ParcelSchema, SessionSchema],
      directory: dir.path,
    );
  }

  Future<List<Parcel>> get allParcels async => await isar.parcels.where().findAll();
  Future<List<Session>> get allSessions async => await isar.sessions.where().findAll();

  Future<void> saveData(String table, Map<String, dynamic> res) async {
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
    await isar.writeTxn(() async {
        await isar.parcels.where().deleteAll();
        await isar.sessions.where().deleteAll();
    });
  }
}
