class ObservationModel {
  late int observationId;
  late int apexValue;
  late double latitude;
  late double longitude;
  late String sessionId;
  late String observerId;
  late int state;

  ObservationModel({
    required this.observationId,
    required this.apexValue,
    required this.latitude,
    required this.longitude,
    required this.sessionId,
    required this.observerId,
    required this.state,
  });

  factory ObservationModel.fromJson(Map<String, dynamic> json) {
    return ObservationModel(
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
