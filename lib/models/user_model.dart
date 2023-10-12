// Table name: utilisateur
class User {
  late String id;
  late String firstname;
  late String lastname;
  late String email;
  late String password;
  late String structure;
  late int dateCreation;
  late int dateMaj;
  late String token;
  late int modelIfv;
  late int state;

  Map toJson() => {
      'id_utilisateur': id,
      'prenom': firstname,
      'nom': lastname,
      'email': email,
      'mot_de_passe': password,
      'structure': structure,
      'date_creation': dateCreation,
      'date_maj': dateMaj,
      'token': token,
      'model_ifv': modelIfv,
      'etat': state,
  };
}
