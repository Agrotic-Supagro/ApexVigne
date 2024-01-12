import 'package:apex_vigne/collections/user.collection.dart';
import 'package:apex_vigne/pages/login/login.page.dart';
import 'package:apex_vigne/pages/profile/widgets/list_tile.widget.dart';
import 'package:apex_vigne/services/isar.service.dart';
import 'package:apex_vigne/shared_widgets/elevated_apex_button.widget.dart';
import 'package:apex_vigne/shared_widgets/offline_dialog.dart';
import 'package:flutter/material.dart';
import 'package:apex_vigne/services/auth.service.dart';
import 'package:material_symbols_icons/symbols.dart';

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
        title: const Text('Profil'),
        actions: [
          if (!AuthenticationService().isOnlineState.value)
            Hero(
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
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Information du compte',
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
                  'Une erreur est survenue lors de la récupération de vos informations',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              );
            }
            final currentUserProfile = snapshot.data!;

            return ListView(
              children: <Widget>[
                ListTileInfo(
                    text: 'Prénom', info: currentUserProfile.firstname),
                Divider(color: Colors.grey[200]),
                ListTileInfo(text: 'Nom', info: currentUserProfile.lastname),
                Divider(color: Colors.grey[200]),
                ListTileInfo(text: 'Email', info: currentUserProfile.email),
                Divider(color: Colors.grey[200]),
                ListTileInfo(
                    text: 'Structure', info: currentUserProfile.structure),
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
        text: 'Se déconnecter',
      ),
    );
  }
}
