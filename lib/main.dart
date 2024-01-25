import 'package:apex_vigne/constants_language.dart';
import 'package:apex_vigne/pages/loading/loading.page.dart';
import 'package:apex_vigne/services/isar.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'color_schemes.g.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await IsarService().initIsar();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const ApexVigneApp());
}

class ApexVigneApp extends StatelessWidget {
  const ApexVigneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      locale: const Locale('en'),
      supportedLocales: const [
        Locale('fr'),
        Locale('en'),
      ],
      title: appName,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        fontFamily: 'MuseoSans',
      ),
      home: const LoadingPage(),
    );
  }
}
