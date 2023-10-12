// Table name: observation
class Observation {
  late int observationId;
  late int apexValue;
  late double latitude;
  late double longitude;
  late String sessionId;
  late String observerId;
  late int state;

  Map toJson() => {
    'id_observation': observationId,
    'apex_value': apexValue,
    'latitude': latitude,
    'longitude': longitude,
    'id_session': sessionId,
    'id_observateur': observerId,
    'etat': state,
  };
}
