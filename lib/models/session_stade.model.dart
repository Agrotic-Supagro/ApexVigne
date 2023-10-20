class SessionStadePheno {
  late String sessionId;
  late String stadeId;
  late int state;

  SessionStadePheno({
    required this.sessionId,
    required this.stadeId,
    required this.state,
  });

  factory SessionStadePheno.fromJson(Map<String, dynamic> json) {
    return SessionStadePheno(
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
