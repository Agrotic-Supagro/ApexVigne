import 'package:isar/isar.dart';
import 'package:apex_vigne/utils/fast_hash.dart';

part 'parcel.collection.g.dart';

@collection
class Parcel {

  @Index(unique: true, replace: true)
  @Name('id_parcelle')
  late String id;

  Id get isarId => fastHash(id);

  @Name('nom_parcelle')
  late String name;

  @Name('date_creation')
  late String creationDate;

  @Name('date_maj')
  late String updateDate;

  @Name('id_proprietaire')
  late String ownerId;

  @Name('etat')
  late String state;
}
