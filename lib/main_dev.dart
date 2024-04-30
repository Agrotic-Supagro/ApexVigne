import 'package:apex_vigne/app_config.dart';
import 'package:apex_vigne/main_common.dart';

Future<void> main() async {
  //AppConfig.apiBaseUrl = 'http://veneo5.servadmin.fr:81';
  AppConfig.apiBaseUrl = 'http://192.168.1.118:81';
  AppConfig.debugShowCheckedModeBanner = true;
  await mainCommon();
}