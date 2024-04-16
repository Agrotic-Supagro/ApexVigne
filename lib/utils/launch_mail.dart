import 'package:url_launcher/url_launcher_string.dart';

void launchMail({String subject = "", String body = ""}) async {
  String mailUrl = 'mailto:leo.pichon@supagro.fr?subject=$subject&body=$body';

  try {
    await launchUrlString(mailUrl);
  } catch (e) {
    print(e);
  }
}
