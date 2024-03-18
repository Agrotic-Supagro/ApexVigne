import 'package:apex_vigne/collections/session.collection.dart';
import 'package:apex_vigne/utils/is_pruned.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

double calculateIcApex(Session s) {
  int sumApex = s.apexFullGrowth + s.apexSlowerGrowth + s.apexStuntedGrowth;
  if (sumApex == 0){
    return 0;
  } else {
    return (s.apexFullGrowth + (s.apexSlowerGrowth / 2)) / sumApex;
  }
}

String calculateHydricConstraint(Session s, double icApex, BuildContext context) {
  int sumApex = s.apexFullGrowth + s.apexSlowerGrowth + s.apexStuntedGrowth;
  double tauxApexFullGrowth = s.apexFullGrowth / sumApex * 100;
  double tauxApexStuntedGrowth = s.apexStuntedGrowth / sumApex * 100;

  if (isPruned(s)) {
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
