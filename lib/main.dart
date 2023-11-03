import 'package:apex_vigne/pages/loading/loading.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'color_schemes.g.dart';

void main() {
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
      title: 'Apex Vigne',
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      // darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: LoadingPage(),
    );
  }
}
