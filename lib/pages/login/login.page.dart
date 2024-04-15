import 'package:apex_vigne/pages/loading/loading.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:apex_vigne/services/auth.service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      title: AppLocalizations.of(context)!.appName,
      //titleTag: 'title',
      logo: const AssetImage('assets/images/logos/logo_apex_vigne_transparent.png'),
      //logoTag: 'logo',
      onLogin: auth.login,
      onSignup: auth.signup,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const LoadingPage(),
        ));
      },
      onRecoverPassword: auth.recoverPassword,
      onConfirmRecover: auth.confirmRecoverPassword,
      theme: LoginTheme(
        titleStyle: const TextStyle(
          color: Colors.white,
          fontSize: 38,
          fontWeight: FontWeight.w500,
        ),
        inputTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
        ),
        cardTopPosition: 200.0,
        buttonTheme: const LoginButtonTheme(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
      loginAfterSignUp: true,
      additionalSignupFields: <UserFormField>[
        UserFormField(
          keyName: 'firstname',
          displayName: AppLocalizations.of(context)!.infoFirstname,
          fieldValidator: (value) {
            if (value == null || value.isEmpty) {
              return 'Entrez votre prénom';
            }
            return null;
          },
          userType: LoginUserType.firstName,
        ),
        UserFormField(
          keyName: 'lastname',
          displayName: AppLocalizations.of(context)!.infoLastname,
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
          displayName: AppLocalizations.of(context)!.infoStructure,
          icon: const Icon(Icons.domain),
          fieldValidator: (value) {
            if (value == null || value.isEmpty) {
              return 'Entrez votre structure';
            }
            return null;
          },
          userType: LoginUserType.text,
        ),
      ],
      messages: LoginMessages(
        userHint: AppLocalizations.of(context)!.hintEmail,
        passwordHint: AppLocalizations.of(context)!.hintPassword,
        confirmPasswordHint: AppLocalizations.of(context)!.hintConfirmPassword,
        confirmPasswordError: AppLocalizations.of(context)!.infoConfirmPasswordError,
        loginButton: AppLocalizations.of(context)!.actionLogin,
        forgotPasswordButton: AppLocalizations.of(context)!.actionForgotPassword,
        recoverPasswordIntro: AppLocalizations.of(context)!.infoRecoverPasswordIntro,
        recoverPasswordDescription: AppLocalizations.of(context)!.infoRecoverPasswordDescription,
        recoverPasswordButton: AppLocalizations.of(context)!.actionRecoverPassword,
        flushbarTitleSuccess: AppLocalizations.of(context)!.titleSuccess,
        recoverPasswordSuccess: AppLocalizations.of(context)!.infoRecoverPasswordSuccess,
        confirmRecoverIntro: AppLocalizations.of(context)!.infoConfirmRecoverIntro,
        recoverCodePasswordDescription: AppLocalizations.of(context)!.infoRecoverCodePasswordDescription,
        recoveryCodeHint: AppLocalizations.of(context)!.hintRecoveryCode,
        confirmRecoverSuccess: AppLocalizations.of(context)!.infoConfirmRecoverSuccess,
        recoveryCodeValidationError: AppLocalizations.of(context)!.infoRecoveryCodeValidationError,
        resendCodeButton: AppLocalizations.of(context)!.actionResendCode,
        resendCodeSuccess: AppLocalizations.of(context)!.infoResendCodeSuccess,
        signupButton: AppLocalizations.of(context)!.actionSignup,
        goBackButton: AppLocalizations.of(context)!.actionGoBack,
        additionalSignUpFormDescription: AppLocalizations.of(context)!.infoSignUpFormDescription,
        additionalSignUpSubmitButton: AppLocalizations.of(context)!.actionConfirm,
      ),
    );
  }
}
