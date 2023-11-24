const String APEX_VIGNE_API_URL = 'https://www.agrotic.org/apexv3-sync';
// const String APEX_VIGNE_API_URL = '192.168.1.13';
const String aboutDescription = 'L\'application ApeX Vigne a été conçue par l\'équipe d\'Explorama pour le compte d\'AgroTIC de Montpellier SupAgro, bénéficiant du soutien de la région Occitanie. Cette initiative s\'inscrit dans le cadre de recherches approfondies menées depuis plusieurs années sur la viticulture de précision. Le projet est réalisé en collaboration avec l\'Institut Français de la Vigne et du Vin (IFV) ainsi que la chambre d\'agriculture de l\'Hérault.';
final List<Map<String, dynamic>> stadesPheno = [
  {
    "name": "Bourgeon d'hiver",
    "stade": "Stade A (BBCH 00 à 02)",
    "description": "Début du gonflement du bourgeon et de la reprise de la végétation.",
    "imgPath": "assets/img/stades_phenologique/stade_a.jpg"
  },
  {
    "name": "Bourgeon dans le coton",
    "stade": "Stade B (BBCH 05)",
    "description": "Les écailles s'écartent, la protection cotonneuse ou bourre devient visible.",
    "imgPath": "assets/img/stades_phenologique/stade_b.jpg"
  },
  {
    "name": "Pointe verte",
    "stade": "Stade C (BBCH 09)",
    "description": "L'extrémité verte de la pousse devient visible.",
    "imgPath": "assets/img/stades_phenologique/stade_c.jpg"
  },
  {
    "name": "Sortie des feuilles",
    "stade": "Stade D (BBCH 10)",
    "description": "Les feuilles rudimentaires sont rassemblées en rosette. Leur base est protégée par la bourre qui est rejetée à pas hors des écailles.",
    "imgPath": "assets/img/stades_phenologique/stade_d.jpg"
  },
  {
    "name": "2 à 3 feuilles étalées",
    "stade": "Stade E (BBCH 11 à 19)",
    "description": "Les feuilles se dégagent l'une après l'autre et se développent. Les premières caractéristiques propres au cépage.",
    "imgPath": "assets/img/stades_phenologique/stade_e.jpg"
  },
  {
    "name": "Grappes visibles",
    "stade": "Stade F (BBCH 53)",
    "description": "La grappe rudimentaire est visible à l'extrémité de la pousse. Quatre à six feuilles sont étalées.",
    "imgPath": "assets/img/stades_phenologique/stade_f.jpg"
  },
  {
    "name": "Boutons floraux agglomérées",
    "stade": "Stade G (BBCH 55)",
    "description": "La grappe se développe. Les boutons floraux restent agglomérés.",
    "imgPath": "assets/img/stades_phenologique/stade_g.jpg"
  },
  {
    "name": "Boutons floraux séparés",
    "stade": "Stade H (BBCH 57)",
    "description": "La grappe est bien développée. Les boutons floraux sont nettement séparés.",
    "imgPath": "assets/img/stades_phenologique/stade_h.jpg"
  },
  {
    "name": "Floraison",
    "stade": "Stade I (BBCH 60 à 69)",
    "description": "Les capuchons floraux se détachent puis tombent. Les étamines et le pistil sont visibles.",
    "imgPath": "assets/img/stades_phenologique/stade_i.jpg"
  },
  {
    "name": "Nouaison",
    "stade": "Stade J (BBCH 71)",
    "description": "Les baies commencent à se développer. les pièces florales chutent.",
    "imgPath": "assets/img/stades_phenologique/stade_j.jpg"
  },
  {
    "name": "Petits pois",
    "stade": "Stade K (BBCH 75)",
    "description": "Les baies ont la taille d'un petit pois. Les grappes s'inclinent vers le bas et gagnent leur position finale.",
    "imgPath": "assets/img/stades_phenologique/stade_k.jpg"
  },
  {
    "name": "Fermeture de la grappe",
    "stade": "Stade L (BBCH 77)",
    "description": "Dans la grappe, les baies sont suffisament grosses pour qu'elles se touchent.",
    "imgPath": "assets/img/stades_phenologique/stade_l.jpg"
  },
  {
    "name": "Véraison",
    "stade": "Stade M (BBCH 81 à 85)",
    "description": "Pour les cépages blancs, les baies deviennent légèrement translucides, et pour les cépages noirs, elles prennent une coloration violettes.",
    "imgPath": "assets/img/stades_phenologique/stade_m.jpg"
  },
  {
    "name": "Maturité",
    "stade": "Stade N (BBCH 89)",
    "description": "Les baies ont atteint leur maturité pour la vendange.",
    "imgPath": "assets/img/stades_phenologique/stade_n.jpg"
  },
  {
    "name": "Fin aoûtement du bois",
    "stade": "Stade O (BBCH 91)",
    "description": "L'aoûtement du bois est amorcé lorsque la véraison arrive à son terme.",
    "imgPath": "assets/img/stades_phenologique/stade_o.jpg"
  },
  {
    "name": "Chute des feuilles",
    "stade": "Stade P (BBCH 92 à 97)",
    "description": "Les feuilles se colorent puis tombent. La vigne entre en repos végétatif.",
    "imgPath": "assets/img/stades_phenologique/stade_p.jpg"
  },
];
