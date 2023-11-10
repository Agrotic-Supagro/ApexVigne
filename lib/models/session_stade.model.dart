class SessionStadePhenoModel {
  late String sessionId;
  late String stadeId;
  late int state;

  SessionStadePhenoModel({
    required this.sessionId,
    required this.stadeId,
    required this.state,
  });

  factory SessionStadePhenoModel.fromJson(Map<String, dynamic> json) {
    return SessionStadePhenoModel(
      sessionId: json['id_session'],
      stadeId: json['id_stade'],
      state: json['etat'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id_session': sessionId,
    'id_stade': stadeId,
    'etat': state,
  };
}
