// Table name: parcelle
class Parcel {
  late String id;
  late String name;
  late int creationDate;
  late int updateDate;
  late String ownerId;
  late int state;

  Map toJson() => {
    'id_parcelle': id,
    'nom_parcelle': name,
    'date_creation': creationDate,
    'date_maj': updateDate,
    'id_proprietaire': ownerId,
    'etat': state,
  };
}
