import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

double calculateIcApex(
    int apexFullGrowth, int apexSlowerGrowth, int apexStuntedGrowth) {
  int sumApex = apexFullGrowth + apexSlowerGrowth + apexStuntedGrowth;
  if (sumApex == 0){
    return 0;
  } else {
    return (apexFullGrowth + (apexSlowerGrowth / 2)) / sumApex;
  }
}

String calculateHydricConstraint(int apexFullGrowth, int apexSlowerGrowth, int apexStuntedGrowth, double icApex, BuildContext context) {
  bool isPruned = apexFullGrowth == 0 && apexSlowerGrowth == 0 && apexStuntedGrowth == 0;
  int sumApex = apexFullGrowth + apexSlowerGrowth + apexStuntedGrowth;
  double tauxApexFullGrowth = apexFullGrowth / sumApex * 100;
  double tauxApexStuntedGrowth = apexStuntedGrowth / sumApex * 100;

  if (isPruned) {
    return AppLocalizations.of(context)!.infoPruned;
  }
  if (icApex >= 0.75) {
    return AppLocalizations.of(context)!.infoAbsent;
  } else if (tauxApexFullGrowth >= 5) {
    return AppLocalizations.of(context)!.infoModerate;
  } else if (tauxApexStuntedGrowth <= 90) {
    return AppLocalizations.of(context)!.infoLow;
  }
  return AppLocalizations.of(context)!.infoSevere;
}
