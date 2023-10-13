import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:apex_vigne/pages/home/home_page.dart';
import 'package:apex_vigne/services/auth_service.dart';

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
      title: 'Apex Vigne',
      onLogin: auth.login,
      onSignup: auth.register,
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
        pageColorLight: Theme.of(context).colorScheme.surfaceVariant,
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
      additionalSignupFields: [
        UserFormField(
          keyName: 'firstName',
          displayName: 'Prénom',
          fieldValidator: (value) {
            if (value == null || value.isEmpty) {
              return 'Entrez votre prénom';
            }
            return null;
          },
          userType: LoginUserType.firstName,
        ),
        UserFormField(
          keyName: 'lastName',
          displayName: 'Nom',
          fieldValidator: (value) {
            if (value == null || value.isEmpty) {
              return 'Entrez votre nom';
            }
            return null;
          },
          userType: LoginUserType.lastName,
        ),
        UserFormField(
          keyName: 'structure',
          displayName: 'Structure',
          fieldValidator: (value) {
            if (value == null || value.isEmpty) {
              return 'Entrez votre structure';
            }
            return null;
          },
          userType: LoginUserType.text,
        )
      ],
      messages: LoginMessages(
        /* Login */
        userHint: 'Email',
        passwordHint: 'Mot de passe',
        confirmPasswordHint: 'Confirmer',
        loginButton: 'Se connecter',
        signupButton: "S'inscrire",
        signUpSuccess: 'Compte créé avec succès',
        forgotPasswordButton: 'Mot de passe oublié ?',
        /* Signup */
        additionalSignUpFormDescription: 'Veuillez remplir les champs suivants',
        additionalSignUpSubmitButton: 'Valider',
        /* Recover Password */
        recoveryCodeHint: 'Code de récupération',
        recoverPasswordIntro: 'Récupération du mot de passe',
        recoverPasswordButton: 'Envoyer',
        recoverPasswordDescription:
            'Nous vous enverrons un email pour réinitialiser votre mot de passe',
        recoverPasswordSuccess: 'Email envoyé',
        goBackButton: 'Annuler',
        confirmPasswordError: 'Les mots de passe ne correspondent pas',
      ),
    );
  }
}
