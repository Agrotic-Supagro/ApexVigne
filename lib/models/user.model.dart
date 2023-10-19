// Table name: utilisateur
class User {
  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.structure,
    required this.dateCreation,
    required this.dateMaj,
    required this.token,
    required this.modelIfv,
    required this.state,
  });

  late String id;
  late String firstname;
  late String lastname;
  late String email;
  late String structure;
  late int dateCreation;
  late int dateMaj;
  late String? token;
  late int modelIfv;
  late int state;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id_utilisateur'],
      firstname: json['prenom'],
      lastname: json['nom'],
      email: json['email'],
      structure: json['structure'],
      dateCreation: json['date_creation'],
      dateMaj: json['date_maj'],
      token: json['token'],
      modelIfv: json['model_ifv'],
      state: json['etat']
    );
  }

  Map toJson() => {
    'id_utilisateur': id,
    'prenom': firstname,
    'nom': lastname,
    'email': email,
    'structure': structure,
    'date_creation': dateCreation,
    'date_maj': dateMaj,
    'token': token,
    'model_ifv': modelIfv,
    'etat': state,
  };
}
