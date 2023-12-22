import 'package:isar/isar.dart';

part 'session.collection.g.dart';

@collection
class Session {

  @Index(unique: true, replace: true)
  late String id;

  Id isarId = Isar.autoIncrement;

  String? createdAt;

  late String sessionAt;

  String? updatedAt;

  late int apexFullGrowth;

  late int apexSlowerGrowth;

  late int apexStuntedGrowth;

  String? observerId;

  late String parcelId;
}
