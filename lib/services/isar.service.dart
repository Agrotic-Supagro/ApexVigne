import 'package:apex_vigne/collections/session.collection.dart';
import 'package:apex_vigne/collections/user.collection.dart';
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
      [ParcelSchema, SessionSchema, UserSchema],
      directory: dir.path,
    );
  }

  Future<List<Parcel>> get allParcels async =>
      await isar.parcels.where().findAll();
  Future<List<Parcel>> get offlineParcels async =>
      await isar.parcels.where().idEqualTo(null).findAll();
  Future<List<Session>> get allSessions async =>
      await isar.sessions.where().findAll();
  Future<List<Session>> get offlineSessions async =>
      await isar.sessions.where().idEqualTo(null).findAll();
  Future<User?> get currentUser async => await isar.users.where().findFirst();

  Future<void> saveDataServer(String name, List<dynamic> res) async {
    final List<Map<String, dynamic>> dataList =
        res.cast<Map<String, dynamic>>();
    await isar.writeTxn(() async {
      if (name == 'parcels') {
        await isar.parcels.where().deleteAll();
        await isar.parcels.importJson(dataList);
      } else if (name == 'sessions') {
        await isar.sessions.where().deleteAll();
        await isar.sessions.importJson(dataList);
      } else if (name == 'me') {
        await isar.users.where().deleteAll();
        await isar.users.importJson(dataList);
      }
    });
  }

  Future<void> saveParcel(Parcel parcel) async {
    await isar.writeTxn(() async {
      await isar.parcels.put(parcel);
    });
  }

  Future<void> saveSession(Session session) async {
    await isar.writeTxn(() async {
      await isar.sessions.put(session);
    });
  }
}
