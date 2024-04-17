import 'package:apex_vigne/app_config.dart';
import 'package:apex_vigne/main_common.dart';

Future<void> main() async {
  AppConfig.apiBaseUrl = 'https://api.apexvigne.agrotic.org';
  //AppConfig.apiBaseUrl = 'http://veneo5.servadmin.fr:81';
  AppConfig.debugShowCheckedModeBanner = false;
  await mainCommon();
}