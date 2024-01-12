import 'package:apex_vigne/pages/about/about.page.dart';
import 'package:apex_vigne/pages/profile/profile.page.dart';
import 'package:apex_vigne/utils/launch_mail.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class DrawerApexVigne extends StatelessWidget {
  const DrawerApexVigne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
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
            ),
          ),
          ListTile(
            title: const Text('Profil'),
            trailing: Icon(Symbols.chevron_right, color: Colors.grey.shade400),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const ProfilPage(),
                ),
              );
            },
          ),
          Divider(
            color: Colors.grey.shade300,
            indent: 10.0,
            endIndent: 30.0,
            height: 10.0,
          ),
          ListTile(
            title: const Text('Nous contacter'),
            trailing: Icon(Symbols.open_in_new, color: Colors.grey.shade400),
            onTap: () {
              launchMail();
            },
          ),
          Divider(
            color: Colors.grey.shade300,
            indent: 10.0,
            endIndent: 30.0,
            height: 10.0,
          ),
          ListTile(
            title: const Text('À propos'),
            trailing: Icon(Symbols.chevron_right, color: Colors.grey.shade400),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const AboutPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
