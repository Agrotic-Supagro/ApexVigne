import 'package:apex_vigne/pages/home/home.page.dart';
import 'package:apex_vigne/pages/login/login.page.dart';
import 'package:flutter/material.dart';
import 'package:apex_vigne/services/auth.service.dart';
import 'package:intl/date_symbol_data_local.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  final AuthenticationService authService = AuthenticationService();

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    await Future.delayed(const Duration(seconds: 1));
    if (!context.mounted) return;

    await authService.checkToken();
    if (!context.mounted) return;

    if (authService.authenticationState.value) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomePage(),
      ));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // change colot status bar
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SafeArea(
        child: Container(
          color: Theme.of(context).colorScheme.primary,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Image(
                    image: AssetImage('assets/img/logo_apex_vigne.png'),
                    fit: BoxFit.cover,
                    width: 180),
                Column(
                  children: [
                    const SizedBox(height: 50),
                    const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
                    const SizedBox(height: 30),
                    Text(
                      'Chargement...',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: Column(
                    children: [
                      Image(
                          image: AssetImage('assets/img/logo_ifv.png'),
                          fit: BoxFit.cover,
                          width: 280),
                      SizedBox(height: 50),
                      Image(
                          image: AssetImage('assets/img/logo_iam.png'),
                          fit: BoxFit.cover,
                          width: 280),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
