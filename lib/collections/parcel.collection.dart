import 'package:isar/isar.dart';

part 'parcel.collection.g.dart';

@collection
class Parcel {
  @Index()
  String? id;

  Id isarId = Isar.autoIncrement;

  late String name;

  String? ownerId;
}
