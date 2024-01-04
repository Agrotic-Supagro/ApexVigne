double calculateIcApex(int apexFullGrowth, int apexSlowerGrowth, int apexStuntedGrowth) {
  int sumApex = apexFullGrowth + apexSlowerGrowth + apexStuntedGrowth;
  sumApex = sumApex == 0 ? 1 : sumApex;
  return (apexFullGrowth + (apexSlowerGrowth / 2)) / sumApex;
}

String calculateHydricConstraint(int apexFullGrowth, int apexSlowerGrowth, int apexStuntedGrowth, double icApex) {
  bool isPruned = apexFullGrowth == 0 && apexSlowerGrowth == 0 && apexStuntedGrowth == 0;
  int sumApex = apexFullGrowth + apexSlowerGrowth + apexStuntedGrowth;
  double tauxApexFullGrowth = apexFullGrowth / sumApex * 100;
  double tauxApexStuntedGrowth = apexStuntedGrowth / sumApex * 100;

  if (isPruned) {
    return 'Écimée';
  }
  if (icApex >= 0.75) {
    return 'Absente';
  } else if (tauxApexFullGrowth >= 5) {
    return 'Modérée';
  } else if (tauxApexStuntedGrowth <= 90) {
    return 'Forte';
  }
  return 'Sévère';
}
