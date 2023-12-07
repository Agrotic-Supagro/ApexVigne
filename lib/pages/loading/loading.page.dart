import 'package:apex_vigne/pages/home/home.page.dart';
import 'package:apex_vigne/pages/login/login.page.dart';
import 'package:apex_vigne/services/server_api.service.dart';
import 'package:flutter/material.dart';
import 'package:apex_vigne/services/auth.service.dart';
import 'package:intl/date_symbol_data_local.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  final AuthenticationService _authService = AuthenticationService();
  final ServerApiService _apiService = ServerApiService();
  String _stepLoadingText = 'Chargement...';

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    if (!context.mounted) return;

    _updateStepLoadingText('Vérification de l\'utilisateur...');
    await _authService.checkToken();

    if (_authService.authenticationState.value) {
      _updateStepLoadingText('Connexion au serveur...');
      final bool isConnected = await _authService.checkConnection();
      if (isConnected) {
        await _fetchDataServer();
      } else {
        _updateStepLoadingText('Lancemenent en mode hors ligne...');
      }
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomePage(),
      ));
    } else {
      _updateStepLoadingText('Authentification requise...');
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ));
    }
  }

  void _updateStepLoadingText(String newText) {
    setState(() {
      _stepLoadingText = newText;
    });
  }

  Future<void> _fetchDataServer() async {
    _updateStepLoadingText('Chargement des parcelles...');
    await _apiService.retrieveData('parcelle');
    _updateStepLoadingText('Chargement des sessions...');
    await _apiService.retrieveData('session');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // change colot status bar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SafeArea(
        child: Container(
          color: Theme.of(context).colorScheme.primary,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Hero(
                  tag: 'logo',
                  child: Image(
                      image: AssetImage('assets/img/logo/logo_apex_vigne.png'),
                      fit: BoxFit.cover,
                      width: 180),
                ),
                const Hero(
                  tag: 'title',
                  child: Text(
                    'ApeX Vigne',
                    style: TextStyle(
                      color: Colors.white60,
                      fontFamily: 'Inter',
                      fontSize: 38,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 6.4,
                    ),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 50),
                    const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
                    const SizedBox(height: 30),
                    Text(
                      _stepLoadingText,
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
                          image: AssetImage('assets/img/logo/logo_ifv.png'),
                          fit: BoxFit.cover,
                          width: 280),
                      SizedBox(height: 50),
                      Image(
                          image: AssetImage('assets/img/logo/logo_iam.png'),
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
