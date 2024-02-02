import 'package:apex_vigne/pages/home/home.page.dart';
import 'package:apex_vigne/pages/login/login.page.dart';
import 'package:apex_vigne/services/isar.service.dart';
import 'package:apex_vigne/services/navigation.service.dart';
import 'package:apex_vigne/services/parcels_api.service.dart';
import 'package:apex_vigne/services/sessions_api.service.dart';
import 'package:flutter/material.dart';
import 'package:apex_vigne/services/auth.service.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  String _stepLoadingText =
      AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
          .infoLoading;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    if (!context.mounted) return;

    _updateStepLoadingText(
      AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
          .infoCheckUser,
    );
    await AuthenticationService().checkToken();

    if (AuthenticationService().authenticationState.value) {
      _updateStepLoadingText(
        AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
            .infoConnectServer,
      );
      final bool isConnected =
          await AuthenticationService().checkConnection(context);
      if (isConnected) {
        await _sendOfflineData();
        await _fetchDataServer();
      } else {
        _updateStepLoadingText(
          AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
              .infoOfflineMode,
        );
      }
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomePage(),
      ));
    } else {
      _updateStepLoadingText(
        AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
            .infoAuthRequired,
      );
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
    _updateStepLoadingText(
      AppLocalizations.of(context)!.infoUserProfileLoading,
    );
    await AuthenticationService().getCurrentUserProfile();
    _updateStepLoadingText(
      AppLocalizations.of(context)!.infoParcelsLoading,
    );
    await ParcelsApiService().getAuthorizedParcels();
    _updateStepLoadingText(
      AppLocalizations.of(context)!.infoSessionsLoading,
    );
    await SessionsApiService().getAuthorizedSessions();
  }

  Future<void> _sendOfflineData() async {
    final offlineParcels = await IsarService().offlineParcels;
    final offlineSessions = await IsarService().offlineSessions;

    if (offlineParcels.isNotEmpty) {
      _updateStepLoadingText(
        AppLocalizations.of(context)!.infoSendParcelServer,
      );
      for (final parcel in offlineParcels) {
        await ParcelsApiService().addParcel(parcel, offlineParcel: true);
      }
    }
    if (offlineSessions.isNotEmpty) {
      _updateStepLoadingText(
        AppLocalizations.of(context)!.infoSendSessionServer,
      );
      for (final session in offlineSessions) {
        await SessionsApiService().addSession(session, offlineSession: true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // change colot status bar
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: Container(
          color: Theme.of(context).colorScheme.primary,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /* Logo */
                const Hero(
                  tag: 'logo',
                  child: Image(
                      image: AssetImage(
                          'assets/images/logos/logo_apex_vigne_transparent.png'),
                      fit: BoxFit.cover,
                      width: 100),
                ),
                /* Title */
                const Hero(
                  tag: 'title',
                  child: Text(
                    'ApeX Vigne',
                    style: TextStyle(
                      color: Colors.white,
                      //fontFamily: 'Inter',
                      fontSize: 38,
                      //fontWeight: FontWeight.w700,
                      //letterSpacing: 6.4,
                    ),
                  ),
                ),
                /* Loading section */
                Column(
                  children: [
                    const SizedBox(height: 50),
                    const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      _stepLoadingText,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                          //letterSpacing: 1.2,
                          //fontWeight: FontWeight.bold
                          ),
                    ),
                  ],
                ),
                _buildBottomSectionLogos(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    /* Build */
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }

  Padding _buildBottomSectionLogos() {
    /* Build */
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          Image(
              image: AssetImage('assets/images/logos/logo_ifv.png'),
              fit: BoxFit.cover,
              height: 40),
          SizedBox(height: 20),
          Image(
              image: AssetImage('assets/images/logos/logo_iam.png'),
              fit: BoxFit.cover,
              height: 40),
        ],
      ),
    );
  }
}
