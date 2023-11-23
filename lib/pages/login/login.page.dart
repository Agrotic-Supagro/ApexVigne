import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:apex_vigne/pages/home/home.page.dart';
import 'package:apex_vigne/services/auth.service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthenticationService auth = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'ApeX Vigne',
      logo: 'assets/img/logo/logo_apex_vigne.png',
      onLogin: auth.login,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const HomePage(),
        ));
      },
      onRecoverPassword: (_) => Future(
        () => null,
      ),
      theme: LoginTheme(
        titleStyle: const TextStyle(
          color: Colors.white60,
          fontFamily: 'Inter',
          fontSize: 38,
          fontWeight: FontWeight.w700,
          letterSpacing: 6.4,
        ),
        inputTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
        ),
        buttonTheme: const LoginButtonTheme(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
      hideForgotPasswordButton: true,
      messages: LoginMessages(
        /* Login */
        userHint: 'Email',
        passwordHint: 'Mot de passe',
        loginButton: 'Se connecter',
      ),
    );
  }
}
