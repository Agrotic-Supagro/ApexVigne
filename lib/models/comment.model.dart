class CommentModel {
  late int id;
  late String text;
  late String sessionId;
  late int state;

  CommentModel({
    required this.id,
    required this.text,
    required this.sessionId,
    required this.state,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id_comm'],
      text: json['txt_comm'],
      sessionId: json['id_session'],
      state: json['etat'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id_comm': id,
    'txt_comm': text,
    'id_session': sessionId,
    'etat': state,
  };
}
