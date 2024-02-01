import 'package:apex_vigne/services/navigation.service.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String formatDate(String? timestamp, {bool explicit = false}) {
  if (timestamp == null || timestamp.isEmpty) {
    return '';
  }
  final date = DateTime.parse(timestamp);
  if (explicit) {
    return DateFormat.MMMMd(
            AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
                .localeName)
        .format(date);
  }

  return DateFormat.Md(
          AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
              .localeName)
      .format(date);
}

// Fonction pour formater les étiquettes de l'axe des abscisses en format de date
String formatGraphDate(double timestamp) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp.toInt());
  return "${dateTime.day}/${dateTime.month}";
}
