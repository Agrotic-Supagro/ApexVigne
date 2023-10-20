class Observation {
  late int observationId;
  late int apexValue;
  late double latitude;
  late double longitude;
  late String sessionId;
  late String observerId;
  late int state;

  Observation({
    required this.observationId,
    required this.apexValue,
    required this.latitude,
    required this.longitude,
    required this.sessionId,
    required this.observerId,
    required this.state,
  });

  factory Observation.fromJson(Map<String, dynamic> json) {
    return Observation(
      observationId: json['id_observation'],
      apexValue: json['apex_value'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      sessionId: json['id_session'],
      observerId: json['id_observateur'],
      state: json['etat'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id_observation': observationId,
    'apex_value': apexValue,
    'latitude': latitude,
    'longitude': longitude,
    'id_session': sessionId,
    'id_observateur': observerId,
    'etat': state,
  };
}
