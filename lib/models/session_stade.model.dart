// Table name: session_stadepheno
class SessionStadePheno {
  late String sessionId;
  late String stadeId;
  late int state;

  Map toJson() => {
    'id_session': sessionId,
    'id_stade': stadeId,
    'etat': state,
  };
}
