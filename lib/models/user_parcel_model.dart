// Table name: utilisateur_parcelle
class UserParcel {
  late String userId;
  late String parcelId;
  late int status;
  late int state;

  Map toJson() => {
    'id_utilisateur': userId,
    'id_parcelle': parcelId,
    'statut': status,
    'etat': state,
  };
}
