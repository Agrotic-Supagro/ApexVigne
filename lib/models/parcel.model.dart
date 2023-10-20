class Parcel {
  late String id;
  late String name;
  late String creationDate;
  late String updateDate;
  late String ownerId;
  late String state;

  Parcel({
    required this.id,
    required this.name,
    required this.creationDate,
    required this.updateDate,
    required this.ownerId,
    required this.state,
  });

  factory Parcel.fromJson(Map<String, dynamic> json) {
    return Parcel(
      id: json['id_parcelle'],
      name: json['nom_parcelle'],
      creationDate: json['date_creation'],
      updateDate: json['date_maj'],
      ownerId: json['id_proprietaire'],
      state: json['etat'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id_parcelle': id,
    'nom_parcelle': name,
    'date_creation': creationDate,
    'date_maj': updateDate,
    'id_proprietaire': ownerId,
    'etat': state,
  };
}
