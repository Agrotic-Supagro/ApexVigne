import 'package:url_launcher/url_launcher_string.dart';

void launchMail() async {
  const mailUrl = 'mailto:leo.pichon@supagro.fr?subject=ApeX Vigne - ';

  try {
    await launchUrlString(mailUrl);
  } catch (e) {
    print(e);
  }
}
