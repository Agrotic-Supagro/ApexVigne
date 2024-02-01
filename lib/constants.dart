/* Local IP address */
// const String apiBaseUrl = 'http://192.168.1.13';
const String apiBaseUrl = 'http://172.17.0.1';

/* Pre Prod */
// const String apiBaseUrl = 'http://212.83.176.36:81';

/* Prod */
// const String apiBaseUrl = '';

final List<Map<String, dynamic>> stadesPheno = [
  {
    "id": "st-A-00-03",
    "name": "Bourgeon d'hiver",
    "stade": "Stade A (BBCH 00 à 02)",
    "description":
        "Début du gonflement du bourgeon et de la reprise de la végétation.",
    "imgPath": "assets/images/stades_phenologique/stade_a.jpg"
  },
  {
    "id": "st-B-05-05",
    "name": "Bourgeon dans le coton",
    "stade": "Stade B (BBCH 05)",
    "description":
        "Les écailles s'écartent, la protection cotonneuse ou bourre devient visible.",
    "imgPath": "assets/images/stades_phenologique/stade_b.jpg"
  },
  {
    "id": "st-C-09-09",
    "name": "Pointe verte",
    "stade": "Stade C (BBCH 09)",
    "description": "L'extrémité verte de la pousse devient visible.",
    "imgPath": "assets/images/stades_phenologique/stade_c.jpg"
  },
  {
    "id": "st-D-10-10",
    "name": "Sortie des feuilles",
    "stade": "Stade D (BBCH 10)",
    "description":
        "Les feuilles rudimentaires sont rassemblées en rosette. Leur base est protégée par la bourre qui est rejetée à pas hors des écailles.",
    "imgPath": "assets/images/stades_phenologique/stade_d.jpg"
  },
  {
    "id": "st-E-11-19",
    "name": "2 à 3 feuilles étalées",
    "stade": "Stade E (BBCH 11 à 19)",
    "description":
        "Les feuilles se dégagent l'une après l'autre et se développent. Les premières caractéristiques propres au cépage.",
    "imgPath": "assets/images/stades_phenologique/stade_e.jpg"
  },
  {
    "id": "st-F-53-53",
    "name": "Grappes visibles",
    "stade": "Stade F (BBCH 53)",
    "description":
        "La grappe rudimentaire est visible à l'extrémité de la pousse. Quatre à six feuilles sont étalées.",
    "imgPath": "assets/images/stades_phenologique/stade_f.jpg"
  },
  {
    "id": "st-G-55-55",
    "name": "Boutons floraux agglomérées",
    "stade": "Stade G (BBCH 55)",
    "description":
        "La grappe se développe. Les boutons floraux restent agglomérés.",
    "imgPath": "assets/images/stades_phenologique/stade_g.jpg"
  },
  {
    "id": "st-H-57-57",
    "name": "Boutons floraux séparés",
    "stade": "Stade H (BBCH 57)",
    "description":
        "La grappe est bien développée. Les boutons floraux sont nettement séparés.",
    "imgPath": "assets/images/stades_phenologique/stade_h.jpg"
  },
  {
    "id": "st-I-60-69",
    "name": "Floraison",
    "stade": "Stade I (BBCH 60 à 69)",
    "description":
        "Les capuchons floraux se détachent puis tombent. Les étamines et le pistil sont visibles.",
    "imgPath": "assets/images/stades_phenologique/stade_i.jpg"
  },
  {
    "id": "st-J-71-71",
    "name": "Nouaison",
    "stade": "Stade J (BBCH 71)",
    "description":
        "Les baies commencent à se développer. les pièces florales chutent.",
    "imgPath": "assets/images/stades_phenologique/stade_j.jpg"
  },
  {
    "id": "st-K-75-75",
    "name": "Petits pois",
    "stade": "Stade K (BBCH 75)",
    "description":
        "Les baies ont la taille d'un petit pois. Les grappes s'inclinent vers le bas et gagnent leur position finale.",
    "imgPath": "assets/images/stades_phenologique/stade_k.jpg"
  },
  {
    "id": "st-L-77-77",
    "name": "Fermeture de la grappe",
    "stade": "Stade L (BBCH 77)",
    "description":
        "Dans la grappe, les baies sont suffisament grosses pour qu'elles se touchent.",
    "imgPath": "assets/images/stades_phenologique/stade_l.jpg"
  },
  {
    "id": "st-M-81-85",
    "name": "Véraison",
    "stade": "Stade M (BBCH 81 à 85)",
    "description":
        "Pour les cépages blancs, les baies deviennent légèrement translucides, et pour les cépages noirs, elles prennent une coloration violettes.",
    "imgPath": "assets/images/stades_phenologique/stade_m.jpg"
  },
  {
    "id": "st-N-89-89",
    "name": "Maturité",
    "stade": "Stade N (BBCH 89)",
    "description": "Les baies ont atteint leur maturité pour la vendange.",
    "imgPath": "assets/images/stades_phenologique/stade_n.jpg"
  },
  {
    "id": "st-O-91-91",
    "name": "Fin aoûtement du bois",
    "stade": "Stade O (BBCH 91)",
    "description":
        "L'aoûtement du bois est amorcé lorsque la véraison arrive à son terme.",
    "imgPath": "assets/images/stades_phenologique/stade_o.jpg"
  },
  {
    "id": "st-P-92-97",
    "name": "Chute des feuilles",
    "stade": "Stade P (BBCH 92 à 97)",
    "description":
        "Les feuilles se colorent puis tombent. La vigne entre en repos végétatif.",
    "imgPath": "assets/images/stades_phenologique/stade_p.jpg"
  },
];
