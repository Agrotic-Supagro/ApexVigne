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

  late String apexFullGrowth;

  late String apexSlowerGrowth;

  late String apexStuntedGrowth;

  late String observerId;

  late String parcelId;
}
