import 'package:isar/isar.dart';

part 'comment.collection.g.dart';

@collection
class Comment {

  @Index(unique: true, replace: true)
  @Name('id_comm')
  late Id id;

  @Name('txt_comm')
  late String text;

  @Name('id_session')
  late String sessionId;

  @Name('etat')
  late int state;
}
