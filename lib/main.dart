import 'package:apex_vigne/pages/loading/loading.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'color_schemes.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fr', 'FR'),
      ],
      title: 'ApeX Vigne',
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme, fontFamily: 'MuseoSans'),
      // darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: const LoadingPage(),
    );
  }
}
