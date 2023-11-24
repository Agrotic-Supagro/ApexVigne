import 'package:isar/isar.dart';
import 'package:apex_vigne/utils/fast_hash.dart';

part 'parcel.collection.g.dart';

@collection
class Parcel {

  @Index(unique: true, replace: true)
  late String id;

  Id get isarId => fastHash(id);

  late String name;

  late String createdAt;

  late String updatedAt;

  late String ownerId;
}
