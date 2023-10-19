import 'package:apex_vigne/pages/login/login.page.dart';
import 'package:flutter/material.dart';
import 'package:apex_vigne/services/auth.service.dart';

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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Profil Page',
            ),
            TextButton(
              onPressed: () {
                auth.logout(() {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ));
                });
              },
              child: const Text('Logout'),
            ),

          ],
        ),
      ),
    );
  }
}
