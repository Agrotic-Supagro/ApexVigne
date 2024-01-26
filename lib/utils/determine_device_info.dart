import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

Future<List<String>> determineDeviceInfo() async {
  late String deviceHardware;
  late String deviceSoftware;

  if (Platform.isAndroid) {
    var androidInfo = await DeviceInfoPlugin().androidInfo;
    var release = androidInfo.version.release;
    var sdkInt = androidInfo.version.sdkInt;
    var manufacturer = androidInfo.manufacturer;
    var model = androidInfo.model;
    deviceHardware = '$manufacturer $model';
    deviceSoftware = 'Android $release (SDK $sdkInt)';
  } else if (Platform.isIOS) {
    var iosInfo = await DeviceInfoPlugin().iosInfo;
    deviceHardware = iosInfo.name;
    deviceSoftware = '${iosInfo.systemName} ${iosInfo.systemVersion}';
  } else {
    deviceHardware = 'Unknown';
    deviceSoftware = 'Unknown';
  }

  return [deviceHardware, deviceSoftware];
}
