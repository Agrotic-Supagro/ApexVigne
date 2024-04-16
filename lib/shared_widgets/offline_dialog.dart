import 'package:apex_vigne/pages/loading/loading.page.dart';
import 'package:apex_vigne/services/auth.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<dynamic> offlineDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(AppLocalizations.of(context)!.titleDisconnected),
        content: Text(AppLocalizations.of(context)!.infoWhyOffline),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(AppLocalizations.of(context)!.actionStayOffline),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const LoadingPage(),
              ));
              AuthenticationService().isOnlineState.value = true;
            },
            child: Text(AppLocalizations.of(context)!.actionGoOnline),
          ),
        ],
      );
    },
  );
}
