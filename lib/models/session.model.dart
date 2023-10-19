// Table name: session
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

  Map toJson() => {
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
