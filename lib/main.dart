import 'package:apex_vigne/pages/loading/loading.page.dart';
import 'package:apex_vigne/services/isar.service.dart';
import 'package:apex_vigne/services/navigation.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'color_schemes.g.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await IsarService().initIsar();
  SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
  if (_sharedPreferences.getString('language') == null) {
    _sharedPreferences.setString('language', 'en');
  }
  Locale locale = Locale(_sharedPreferences.getString('language')!);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(ApexVigneApp(locale: locale));
}

class ApexVigneApp extends StatefulWidget {
  const ApexVigneApp({
    super.key,
    required this.locale,
  });

  @override
  State<ApexVigneApp> createState() => _ApexVigneAppState();

  final Locale locale;
  static _ApexVigneAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_ApexVigneAppState>();
}

class _ApexVigneAppState extends State<ApexVigneApp> {
  Locale _locale = AppLocalizations.supportedLocales.first;

  void changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
      SharedPreferences.getInstance().then((prefs) {
        prefs.setString('language', locale.languageCode);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      locale: widget.locale,
      supportedLocales: const [
        Locale('fr'),
        Locale('en'),
      ],
      title: 'ApeX Vigne',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        fontFamily: 'MuseoSans',
      ),
      home: const LoadingPage(),
    );
  }
}
