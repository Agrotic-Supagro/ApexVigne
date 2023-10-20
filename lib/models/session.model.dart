class Session {
  late String id;
  late int creationDate;
  late int updateDate;
  late int sessionDate;
  late int apex0;
  late int apex1;
  late int apex2;
  late String observerId;
  late String parcelId;
  late int state;

  Session({
    required this.id,
    required this.creationDate,
    required this.updateDate,
    required this.sessionDate,
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
      updateDate: json['date_maj'],
      sessionDate: json['date_session'],
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
