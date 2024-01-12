import 'package:url_launcher/url_launcher_string.dart';

void launchMail() async {
  const mailUrl = 'mailto:test@gmail.com?subject=Nous contacter';

  try {
    await launchUrlString(mailUrl);
  } catch (e) {
    print(e);
  }
}
