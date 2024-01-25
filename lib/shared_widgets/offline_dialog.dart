import 'package:apex_vigne/constants_language.dart';
import 'package:apex_vigne/pages/loading/loading.page.dart';
import 'package:apex_vigne/services/auth.service.dart';
import 'package:flutter/material.dart';

Future<dynamic> offlineDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text(titleDisconnected),
        content: const Text(
          infoWhyOffline,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(actionStayOffline),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const LoadingPage(),
              ));
              AuthenticationService().isOnlineState.value = true;
            },
            child: const Text(actionGoOnline),
          ),
        ],
      );
    },
  );
}
