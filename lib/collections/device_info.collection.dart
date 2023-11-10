import 'package:isar/isar.dart';

part 'device_info.collection.g.dart';

@collection
class DeviceInfo {

  @Index(unique: true, replace: true)
  @Name('id_config')
  late Id configId;

  @Name('device_model')
  late String deviceModel;

  @Name('device_platform')
  late String devicePlatform;

  @Name('device_uuid')
  late String deviceUuid;

  @Name('device_version')
  late String deviceVersion;

  @Name('device_manufacturer')
  late String deviceManufacturer;

  @Name('device_serial')
  late String deviceSerial;

  @Name('id_utilisateur')
  late String idUser;

  @Name('etat')
  late int state;
}
