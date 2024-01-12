import 'package:apex_vigne/pages/loading/loading.page.dart';
import 'package:apex_vigne/services/auth.service.dart';
import 'package:flutter/material.dart';

Future<dynamic> offlineDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Vous êtes déconnecté'),
        content: const Text(
          'Celà peut être dû à une mauvaise connexion internet ou à une maintenance du serveur.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Rester déconnecté'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const LoadingPage(),
              ));
              AuthenticationService().isOnlineState.value = true;
            },
            child: const Text('Se connecter'),
          ),
        ],
      );
    },
  );
}
