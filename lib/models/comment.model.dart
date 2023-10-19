// Table name: commentaire
class Comment {
  late int id;
  late String text;
  late String sessionId;
  late int state;

  Map toJson() => {
    'id_comm': id,
    'txt_comm': text,
    'id_session': sessionId,
    'etat': state,
  };
}
