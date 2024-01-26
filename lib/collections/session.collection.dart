import 'package:isar/isar.dart';

part 'session.collection.g.dart';

@collection
class Session {
  @Index()
  String? id;

  Id isarId = Isar.autoIncrement;

  late String sessionAt;

  late int apexFullGrowth;

  late int apexSlowerGrowth;

  late int apexStuntedGrowth;

  String? observerId;

  late String parcelId;

  String? notes;

  String? stadePhenoId;

  double? latitude;

  double? longitude;

  late int inField;

  String? deviceHardware;

  String? deviceSoftware;
}
