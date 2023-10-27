class Session {
  late String id;
  late String creationDate;
  late String sessionDate;
  late String updateDate;
  late String apex0;
  late String apex1;
  late String apex2;
  late String observerId;
  late String parcelId;
  late String state;

  Session({
    required this.id,
    required this.creationDate,
    required this.sessionDate,
    required this.updateDate,
    required this.apex0,
    required this.apex1,
    required this.apex2,
    required this.observerId,
    required this.parcelId,
    required this.state,
  });

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      id: json['id_session'],
      creationDate: json['date_creation'],
      sessionDate: json['date_session'],
      updateDate: json['date_maj'],
      apex0: json['apex0'],
      apex1: json['apex1'],
      apex2: json['apex2'],
      observerId: json['id_observateur'],
      parcelId: json['id_parcelle'],
      state: json['etat'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id_session': id,
    'date_creation': creationDate,
    'date_maj': updateDate,
    'date_session': sessionDate,
    'apex0': apex0,
    'apex1': apex1,
    'apex2': apex2,
    'id_observateur': observerId,
    'id_parcelle': parcelId,
    'etat': state,
  };
}
