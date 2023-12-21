import 'package:isar/isar.dart';
import 'package:apex_vigne/utils/fast_hash.dart';

part 'user.collection.g.dart';

@collection
class User {

  @Index(unique: true, replace: true)
  late String id;

  Id get isarId => fastHash(id);

  late String firstname;

  late String lastname;

  late String email;

  late String structure;

  late int ifvModel;
}
