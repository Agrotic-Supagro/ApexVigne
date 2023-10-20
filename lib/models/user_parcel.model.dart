// Table name: utilisateur_parcelle
class UserParcel {
  UserParcel({
    required this.userId,
    required this.parcelId,
    required this.status,
    required this.state
  });

  late String userId;
  late String parcelId;
  late int status;
  late int state;

  factory UserParcel.fromJson(Map<String, dynamic> json) {
    return UserParcel(
      userId: json['id_utilisateur'],
      parcelId: json['id_parcelle'],
      status: json['statut'],
      state: json['etat'],
    );
  }

  Map toJson() => {
    'id_utilisateur': userId,
    'id_parcelle': parcelId,
    'statut': status,
    'etat': state,
  };
}
