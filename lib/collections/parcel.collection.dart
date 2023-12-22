import 'package:isar/isar.dart';

part 'parcel.collection.g.dart';

@collection
class Parcel {

  @Index(unique: true, replace: true)
  String? id;

  Id isarId = Isar.autoIncrement;

  late String name;

  String? createdAt;

  String? updatedAt;

  String? ownerId;
}
