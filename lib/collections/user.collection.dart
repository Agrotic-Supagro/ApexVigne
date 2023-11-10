import 'package:isar/isar.dart';
import 'package:apex_vigne/utils/fast_hash.dart';

part 'user.collection.g.dart';

@collection
class User {

  @Index(unique: true, replace: true)
  @Name('id_utilisateur')
  late String id;

  Id get isarId => fastHash(id);

  @Name('prenom')
  late String firstname;

  @Name('nom')
  late String lastname;

  @Name('email')
  late String email;

  @Name('structure')
  late String structure;

  @Name('date_creation')
  late int creationDate;

  @Name('date_maj')
  late int updateDate;

  @Name('token')
  late String? token;

  @Name('model_ifv')
  late int ifvModel;

  @Name('etat')
  late int state;
}
