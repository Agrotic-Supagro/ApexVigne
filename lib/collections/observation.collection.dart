import 'package:isar/isar.dart';

part 'observation.collection.g.dart';

@collection
class Observation {

  @Index(unique: true, replace: true)
  @Name('id_observation')
  late Id observationId;

  @Name('apex_value')
  late int apexValue;

  @Name('latitude')
  late double latitude;

  @Name('longitude')
  late double longitude;

  @Name('id_session')
  late String sessionId;

  @Name('id_observateur')
  late String observerId;

  @Name('etat')
  late int state;
}
