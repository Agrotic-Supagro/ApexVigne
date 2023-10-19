// Table name: device_info
class DeviceInfo {
  late int configId;
  late String deviceModel;
  late String devicePlatform;
  late String deviceUuid;
  late String deviceVersion;
  late String deviceManufacturer;
  late String deviceSerial;
  late String idUser;
  late int state;

  Map toJson() => {
    'id_config': configId,
    'device_model': deviceModel,
    'device_platform': devicePlatform,
    'device_uuid': deviceUuid,
    'device_version': deviceVersion,
    'device_manufacturer': deviceManufacturer,
    'device_serial': deviceSerial,
    'id_utilisateur': idUser,
    'etat': state,
  };
}
