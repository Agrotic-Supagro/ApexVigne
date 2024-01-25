import 'package:apex_vigne/constants_language.dart';
import 'package:apex_vigne/pages/loading/loading.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
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
      title: appName,
      titleTag: 'title',
      logo: 'assets/images/logos/logo_apex_vigne_transparent.png',
      logoTag: 'logo',
      onLogin: auth.login,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const LoadingPage(),
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
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
      hideForgotPasswordButton: true,
      messages: LoginMessages(
        /* Login */
        userHint: hintEmail,
        passwordHint: hintPassword,
        loginButton: actionLogin,
      ),
    );
  }
}
