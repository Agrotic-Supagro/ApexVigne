import 'package:apex_vigne/services/navigation.service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/* Local IP address */
 const String apiBaseUrl = 'http://192.168.1.118';
// const String apiBaseUrl = 'http://172.17.0.1';

/* Pre Prod */
// const String apiBaseUrl = 'http://veneo5.servadmin.fr:81';

/* Prod */
// const String apiBaseUrl = '';

final List<Map<String, dynamic>> stadesPheno = [
  {
    "id": "st-A-00-03",
    "name": AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
        .nameStadeA,
    "stade": "Stade A (BBCH 00 à 03)",
    "description":
        AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
            .descriptionStadeA,
    "imgPath": "assets/images/stades_phenologique/stade_a.jpg"
  },
  {
    "id": "st-B-05-05",
    "name": AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
        .nameStadeB,
    "stade": "Stade B (BBCH 05)",
    "description":
        AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
            .descriptionStadeB,
    "imgPath": "assets/images/stades_phenologique/stade_b.jpg"
  },
  {
    "id": "st-C-09-09",
    "name": AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
        .nameStadeC,
    "stade": "Stade C (BBCH 09)",
    "description":
        AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
            .descriptionStadeC,
    "imgPath": "assets/images/stades_phenologique/stade_c.jpg"
  },
  {
    "id": "st-D-10-10",
    "name": AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
        .nameStadeD,
    "stade": "Stade D (BBCH 10)",
    "description":
        AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
            .descriptionStadeD,
    "imgPath": "assets/images/stades_phenologique/stade_d.jpg"
  },
  {
    "id": "st-E-11-19",
    "name": AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
        .nameStadeE,
    "stade": "Stade E (BBCH 11 à 19)",
    "description":
        AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
            .descriptionStadeE,
    "imgPath": "assets/images/stades_phenologique/stade_e.jpg"
  },
  {
    "id": "st-F-53-53",
    "name": AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
        .nameStadeF,
    "stade": "Stade F (BBCH 53)",
    "description":
        AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
            .descriptionStadeF,
    "imgPath": "assets/images/stades_phenologique/stade_f.jpg"
  },
  {
    "id": "st-G-55-55",
    "name": AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
        .nameStadeG,
    "stade": "Stade G (BBCH 55)",
    "description":
        AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
            .descriptionStadeG,
    "imgPath": "assets/images/stades_phenologique/stade_g.jpg"
  },
  {
    "id": "st-H-57-57",
    "name": AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
        .nameStadeH,
    "stade": "Stade H (BBCH 57)",
    "description":
        AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
            .descriptionStadeH,
    "imgPath": "assets/images/stades_phenologique/stade_h.jpg"
  },
  {
    "id": "st-I-60-69",
    "name": AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
        .nameStadeI,
    "stade": "Stade I (BBCH 60 à 69)",
    "description":
        AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
            .descriptionStadeI,
    "imgPath": "assets/images/stades_phenologique/stade_i.jpg"
  },
  {
    "id": "st-J-71-71",
    "name": AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
        .nameStadeJ,
    "stade": "Stade J (BBCH 71)",
    "description":
        AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
            .descriptionStadeJ,
    "imgPath": "assets/images/stades_phenologique/stade_j.jpg"
  },
  {
    "id": "st-K-75-75",
    "name": AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
        .nameStadeK,
    "stade": "Stade K (BBCH 75)",
    "description":
        AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
            .descriptionStadeK,
    "imgPath": "assets/images/stades_phenologique/stade_k.jpg"
  },
  {
    "id": "st-L-77-77",
    "name": AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
        .nameStadeL,
    "stade": "Stade L (BBCH 77)",
    "description":
        AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
            .descriptionStadeL,
    "imgPath": "assets/images/stades_phenologique/stade_l.jpg"
  },
  {
    "id": "st-M-81-85",
    "name": AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
        .nameStadeM,
    "stade": "Stade M (BBCH 81 à 85)",
    "description":
        AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
            .descriptionStadeM,
    "imgPath": "assets/images/stades_phenologique/stade_m.jpg"
  },
  {
    "id": "st-N-89-89",
    "name": AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
        .nameStadeN,
    "stade": "Stade N (BBCH 89)",
    "description":
        AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
            .descriptionStadeN,
    "imgPath": "assets/images/stades_phenologique/stade_n.jpg"
  },
  {
    "id": "st-O-91-91",
    "name": AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
        .nameStadeO,
    "stade": "Stade O (BBCH 91)",
    "description":
        AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
            .descriptionStadeO,
    "imgPath": "assets/images/stades_phenologique/stade_o.jpg"
  },
  {
    "id": "st-P-92-97",
    "name": AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
        .nameStadeP,
    "stade": "Stade P (BBCH 92 à 97)",
    "description":
        AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
            .descriptionStadeP,
    "imgPath": "assets/images/stades_phenologique/stade_p.jpg"
  },
];
