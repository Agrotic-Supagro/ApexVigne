import 'package:isar/isar.dart';
import 'package:apex_vigne/utils/fast_hash.dart';

part 'session.collection.g.dart';

@collection
class Session {

  @Index(unique: true, replace: true)
  late String id;

  Id get isarId => fastHash(id);

  late String createdAt;

  late String sessionAt;

  late String updatedAt;

  late int apexFullGrowth;

  late int apexSlowerGrowth;

  late int apexStuntedGrowth;

  late String observerId;

  late String parcelId;
}
