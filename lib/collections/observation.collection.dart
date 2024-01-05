import 'package:isar/isar.dart';

part 'observation.collection.g.dart';

@collection
class Observation {
  @Index()
  late Id observationId;

  late int apexValue;

  late double latitude;

  late double longitude;

  late String sessionId;

  late String observerId;
}
