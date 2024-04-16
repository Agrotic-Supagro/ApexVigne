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

/// Fonction pour formater les étiquettes de l'axe des abscisses en format de date
/*String formatGraphDate(double dayOfYear, int yearInMillisecondsSinceEpoch) {
  var millisdayofyear = dayOfYear * 86400000; //86400000 = milliseconds in a day
  DateTime date = DateTime.fromMillisecondsSinceEpoch(yearInMillisecondsSinceEpoch + millisdayofyear.toInt());

  return DateFormat.Md(
          AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
              .localeName)
      .format(date);
}*/

/// Fonction pour formater les étiquettes de l'axe des abscisses en format de date
/// en entrée la date est de format double 20240113.0
/*String formatGraphDate(double dateDouble) {
  String dateString = dateDouble.toStringAsFixed(0);
  DateTime date = DateTime.parse(dateString);

  return DateFormat.Md(
          AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
              .localeName)
      .format(date);
}*/

/// Fonction pour formater les étiquettes de l'axe des abscisses en format de date
/// en entrée la 1ère valeur est le nombre de jours à ajouter à la date de la 2nd entrée
String formatGraphDate(double daysFromStart, DateTime start) {
  DateTime date = start.add(Duration(days:daysFromStart.toInt(), hours: 12)); // we add 12h to be sure to be in the middle of the day and prevent problem with DST

  return DateFormat.Md(
          AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
              .localeName)
      .format(date);
}
