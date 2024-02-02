import 'package:apex_vigne/collections/user.collection.dart';
import 'package:apex_vigne/main.dart';
import 'package:apex_vigne/pages/login/login.page.dart';
import 'package:apex_vigne/pages/profile/widgets/list_tile.widget.dart';
import 'package:apex_vigne/services/isar.service.dart';
import 'package:apex_vigne/shared_widgets/elevated_apex_button.widget.dart';
import 'package:apex_vigne/shared_widgets/offline_dialog.dart';
import 'package:flutter/material.dart';
import 'package:apex_vigne/services/auth.service.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  final AuthenticationService auth = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(AppLocalizations.of(context)!.titleProfile),
        actions: [
          if (!AuthenticationService().isOnlineState.value)
            _buildOfflineButton(context),
          _buildLanguageButton(context),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              AppLocalizations.of(context)!.infoAccount,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(letterSpacing: 1.2),
            ),
            const SizedBox(height: 20),
            _buildProfilInfo(),
            LogoutButton(auth: auth),
          ],
        ),
      ),
    );
  }

  Hero _buildOfflineButton(BuildContext context) {
    return Hero(
      tag: 'offline',
      flightShuttleBuilder: (flightContext, animation, flightDirection,
          fromHeroContext, toHeroContext) {
        return const Icon(
          Icons.cloud_off,
          color: Colors.white,
          size: 28.0,
        );
      },
      child: IconButton(
        icon: const Icon(
          Symbols.cloud_off,
          weight: 350,
          size: 28.0,
        ),
        onPressed: () {
          offlineDialog(context);
        },
      ),
    );
  }

  Widget _buildLanguageButton(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Symbols.language),
      onSelected: (String selectedLanguage) {
        if (selectedLanguage == 'Français') {
          ApexVigneApp.of(context)?.changeLanguage(const Locale('fr'));
        } else if (selectedLanguage == 'English') {
          ApexVigneApp.of(context)?.changeLanguage(const Locale('en'));
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          'Français', // Remplacez-le par la langue que vous utilisez
          'English', // Remplacez-le par la langue que vous utilisez
          // Ajoutez d'autres langues selon vos besoins
        ].map((String language) {
          return PopupMenuItem<String>(
            value: language,
            child: Text(language),
          );
        }).toList();
      },
    );
  }

  Expanded _buildProfilInfo() {
    /* Build */
    return Expanded(
      child: FutureBuilder<User?>(
          future: IsarService().currentUser,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError || snapshot.data == null) {
              return Center(
                child: Text(
                  AppLocalizations.of(context)!.infoErrorProfileInfo,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              );
            }
            final currentUserProfile = snapshot.data!;

            return ListView(
              children: <Widget>[
                ListTileInfo(
                  text: AppLocalizations.of(context)!.infoFirstname,
                  info: currentUserProfile.firstname,
                ),
                Divider(color: Colors.grey[200]),
                ListTileInfo(
                  text: AppLocalizations.of(context)!.infoLastname,
                  info: currentUserProfile.lastname,
                ),
                Divider(color: Colors.grey[200]),
                ListTileInfo(
                  text: AppLocalizations.of(context)!.infoEmail,
                  info: currentUserProfile.email,
                ),
                Divider(color: Colors.grey[200]),
                ListTileInfo(
                  text: AppLocalizations.of(context)!.infoStructure,
                  info: currentUserProfile.structure,
                ),
              ],
            );
          }),
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
    required this.auth,
  });

  final AuthenticationService auth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ElevatedApexButton(
        callback: () {
          auth.logout(() {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ));
          });
        },
        text: AppLocalizations.of(context)!.actionLogout,
      ),
    );
  }
}