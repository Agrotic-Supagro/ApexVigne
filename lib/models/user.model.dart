// Table name: utilisateur
class User {
  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.structure,
    required this.creationDate,
    required this.updateDate,
    required this.token,
    required this.ifvModel,
    required this.state,
  });

  late String id;
  late String firstname;
  late String lastname;
  late String email;
  late String structure;
  late int creationDate;
  late int updateDate;
  late String? token;
  late int ifvModel;
  late int state;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id_utilisateur'],
      firstname: json['prenom'],
      lastname: json['nom'],
      email: json['email'],
      structure: json['structure'],
      creationDate: json['date_creation'],
      updateDate: json['date_maj'],
      token: json['token'],
      ifvModel: json['model_ifv'],
      state: json['etat']
    );
  }

  Map toJson() => {
    'id_utilisateur': id,
    'prenom': firstname,
    'nom': lastname,
    'email': email,
    'structure': structure,
    'date_creation': creationDate,
    'date_maj': updateDate,
    'token': token,
    'model_ifv': ifvModel,
    'etat': state,
  };
}
