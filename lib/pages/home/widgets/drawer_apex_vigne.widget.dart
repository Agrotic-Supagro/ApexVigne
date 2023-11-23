import 'package:apex_vigne/pages/about/about.page.dart';
import 'package:apex_vigne/pages/contact/contact.page.dart';
import 'package:apex_vigne/pages/profil/profil.page.dart';
import 'package:flutter/material.dart';

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
            child: Text('Menu', style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const ProfilPage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Nous contacter'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const ContactPage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('À propos'),
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
