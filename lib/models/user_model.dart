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

  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
    required this.structure,
    required this.dateCreation,
    required this.dateMaj,
    required this.token,
    required this.modelIfv,
    required this.state,
  });
}
