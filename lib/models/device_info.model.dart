class DeviceInfoModel {
  late int configId;
  late String deviceModel;
  late String devicePlatform;
  late String deviceUuid;
  late String deviceVersion;
  late String deviceManufacturer;
  late String deviceSerial;
  late String idUser;
  late int state;

  DeviceInfoModel({
    required this.configId,
    required this.deviceModel,
    required this.devicePlatform,
    required this.deviceUuid,
    required this.deviceVersion,
    required this.deviceManufacturer,
    required this.deviceSerial,
    required this.idUser,
    required this.state,
  });

  factory DeviceInfoModel.fromJson(Map<String, dynamic> json) {
    return DeviceInfoModel(
      configId: json['id_config'],
      deviceModel: json['device_model'],
      devicePlatform: json['device_platform'],
      deviceUuid: json['device_uuid'],
      deviceVersion: json['device_version'],
      deviceManufacturer: json['device_manufacturer'],
      deviceSerial: json['device_serial'],
      idUser: json['id_utilisateur'],
      state: json['etat'],
    );
  }

  Map<String, dynamic> toJson() => {
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
