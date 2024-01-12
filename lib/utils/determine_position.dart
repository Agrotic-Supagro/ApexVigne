import 'package:geolocator/geolocator.dart';

Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error(
          'Il faut autoriser la localisation pour pouvoir créer une session');
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Il faut autoriser la localisation dans les paramètres de votre téléphone pour pouvoir créer une session');
    }
  }

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error(
        'La localisation sur votre téléphone n\'est pas activé.');
  }

  return await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.best,
  );
}
