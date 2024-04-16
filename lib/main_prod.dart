import 'package:apex_vigne/app_config.dart';
import 'package:apex_vigne/main_common.dart';

Future<void> main() async {
  AppConfig.apiBaseUrl = 'http://api.apexvigne.agrotic.org:81';
  await mainCommon();
}