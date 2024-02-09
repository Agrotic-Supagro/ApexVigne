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
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final String? languageCode = sharedPreferences.getString('language');
  Locale? locale = languageCode != null ? Locale(languageCode) : null;
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

  final Locale? locale;
  static _ApexVigneAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_ApexVigneAppState>();
}

class _ApexVigneAppState extends State<ApexVigneApp> {
  late Locale? _locale;

  @override
  void initState() {
    super.initState();
    _locale = widget.locale;
  }

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
      locale: _locale,
      supportedLocales: const [
        Locale('fr'),
        Locale('en'),
        Locale('it'),
        Locale('es'),
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
