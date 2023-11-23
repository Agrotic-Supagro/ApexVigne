import 'package:apex_vigne/models/user.model.dart';
import 'package:apex_vigne/pages/login/login.page.dart';
import 'package:apex_vigne/pages/profil/widgets/list_tile.widget.dart';
import 'package:apex_vigne/services/shared_prefs.service.dart';
import 'package:apex_vigne/shared_widgets/elevated_apex_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:apex_vigne/services/auth.service.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  final AuthenticationService auth = AuthenticationService();
  final userStorage = SharedPrefsService<UserModel>('user', (json) => UserModel.fromJson(json));
  UserModel? currentUserProfile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Information du compte', style: Theme.of(context).textTheme.labelMedium!.copyWith(letterSpacing: 1.2)),
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<UserModel?>(
                future: userStorage.getData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Une erreur est survenue lors de la récupération de vos informations',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    );
                  }
                  currentUserProfile = snapshot.data;

                  return ListView(
                    children: <Widget>[
                      ListTileInfo(text: 'Prénom', info: currentUserProfile?.firstname),
                      Divider(color: Colors.grey[200]),
                      ListTileInfo(text: 'Nom', info: currentUserProfile?.lastname),
                      Divider(color: Colors.grey[200]),
                      ListTileInfo(text: 'Email', info: currentUserProfile?.email),
                      Divider(color: Colors.grey[200]),
                      ListTileInfo(text: 'Structure', info: currentUserProfile?.structure),
                    ],
                  );
                }
              ),
            ),
            Container(
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
            ),
          ],
        ),
      ),
    );
  }
}
