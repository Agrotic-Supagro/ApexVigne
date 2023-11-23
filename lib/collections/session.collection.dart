import 'package:isar/isar.dart';
import 'package:apex_vigne/utils/fast_hash.dart';

part 'session.collection.g.dart';

@collection
class Session {

  @Index(unique: true, replace: true)
  @Name('id_session')
  late String id;

  Id get isarId => fastHash(id);

  @Name('date_creation')
  late String creationDate;

  @Name('date_session')
  late String sessionDate;

  @Name('date_maj')
  late String updateDate;

  late String apex0;

  late String apex1;

  late String apex2;

  @Name('id_observateur')
  late String observerId;

  @Name('id_parcelle')
  late String parcelId;

  @Name('etat')
  late String state;
}
