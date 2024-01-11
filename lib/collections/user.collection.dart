import 'package:isar/isar.dart';

part 'user.collection.g.dart';

@collection
class User {

  @Index(unique: true, replace: true)
  late String id;

  Id isarId = Isar.autoIncrement;

  late String firstname;

  late String lastname;

  late String email;

  late String structure;

  late int ifvModel;
}
