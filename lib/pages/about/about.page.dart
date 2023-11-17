import 'package:apex_vigne/models/user.model.dart';
import 'package:apex_vigne/services/storage.service.dart';
import 'package:flutter/material.dart';
import 'package:apex_vigne/services/auth.service.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final AuthenticationService auth = AuthenticationService();
  final userStorage =
      StorageService<User>('user', (json) => User.fromJson(json));
  User? currentUserProfile;

  @override
  Widget build(BuildContext context) {
    const aboutDescription =
        'L\'application ApeX Vigne a été conçue par l\'équipe d\'Explorama pour le compte d\'AgroTIC de Montpellier SupAgro, bénéficiant du soutien de la région Occitanie. Cette initiative s\'inscrit dans le cadre de recherches approfondies menées depuis plusieurs années sur la viticulture de précision. Le projet est réalisé en collaboration avec l\'Institut Français de la Vigne et du Vin (IFV) ainsi que la chambre d\'agriculture de l\'Hérault.';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text('À propos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Application ApeX Vigne',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(letterSpacing: 1.2)),
            const SizedBox(height: 20),
            Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  color: Color(0xFFF5F5F5),
                ),
                child: Text(aboutDescription,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(letterSpacing: 1.2, color: Colors.grey[700]))),
            const SizedBox(height: 20),
            Text('Partenaires',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(letterSpacing: 1.2)),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  color: Color(0xFFF5F5F5),
                ),
                child: const Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  runSpacing: 20,
                  children: [
                    Image(image: AssetImage('assets/img/logo_ifv.png'), width: 145),
                    SizedBox(width: 20),
                    Image(image: AssetImage('assets/img/logo_iam.png'), width: 145),
                    SizedBox(width: 20),
                    Image(image: AssetImage('assets/img/logo_occitanie.png'), width: 145),
                    SizedBox(width: 20),
                    Image(image: AssetImage('assets/img/logo_agrotic.png'), width: 145),
                    SizedBox(width: 20),
                    Image(image: AssetImage('assets/img/logo_agricultures_territoires.png'), width: 145),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
