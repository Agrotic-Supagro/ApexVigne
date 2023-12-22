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
  // TODO: A voir si on garde le ifvClasse
  int ifvClasse = -1;

  if (isPruned) {
    ifvClasse = 4;
    return 'Écimée';
  }
  if (icApex >= 0.75) {
    ifvClasse = 0;
    return 'Absente';
  } else if (tauxApexFullGrowth >= 5) {
    ifvClasse = 1;
    return 'Modérée';
  } else if (tauxApexStuntedGrowth <= 90) {
    ifvClasse = 2;
    return 'Forte';
  }
  ifvClasse = 3;
  return 'Sévère';
}
