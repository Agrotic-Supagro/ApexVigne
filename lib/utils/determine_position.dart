import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<Position> determinePosition(BuildContext context) async {
  bool serviceEnabled;
  LocationPermission permission;

  if (!context.mounted) return Future.error('context not mounted');

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error(AppLocalizations.of(context)!.infoLocationRequired);
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          AppLocalizations.of(context)!.infoEnableLocationSystem);
    }
  }

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error(AppLocalizations.of(context)!.infoLocationDisabled);
  }

  return await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.best,
  );
}

Future<void> checkLocationPermission(BuildContext context) async {
  bool serviceEnabled;
  LocationPermission permission;

  if (!context.mounted) return Future.error('context not mounted');

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error(AppLocalizations.of(context)!.infoLocationRequired);
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          AppLocalizations.of(context)!.infoEnableLocationSystem);
    }
  }

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error(AppLocalizations.of(context)!.infoLocationDisabled);
  }
}
