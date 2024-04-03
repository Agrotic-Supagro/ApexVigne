import 'package:apex_vigne/pages/about/about.page.dart';
import 'package:apex_vigne/pages/profile/profile.page.dart';
import 'package:apex_vigne/services/auth.service.dart';
import 'package:apex_vigne/shared_widgets/elevated_apex_button.widget.dart';
import 'package:apex_vigne/services/sessions_api.service.dart';
import 'package:apex_vigne/utils/launch_mail.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawerApexVigne extends StatelessWidget {
  const DrawerApexVigne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        const Image(
                            image: AssetImage('assets/images/logos/logo_apex_vigne_transparent.png'),
                            fit: BoxFit.cover,
                            height: 70,
                        ),
                        Text(AppLocalizations.of(context)!.appName,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  title: Text(AppLocalizations.of(context)!.titleProfile),
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
                  title: Text(AppLocalizations.of(context)!.titleContact),
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
                  title: Text(AppLocalizations.of(context)!.titleAbout),
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
                Divider(
                  color: Colors.grey.shade300,
                  indent: 10.0,
                  endIndent: 30.0,
                  height: 10.0,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ElevatedApexButton(
                    callback: () async {
                      final SessionsApiService sessionsApiService = SessionsApiService();
                      await sessionsApiService.exportSessions(context);
                    },
                    text: AppLocalizations.of(context)!.actionExport,
                  )
                )
              ],
            ),
          ),
          const Row(
            children: [
              SizedBox(width: 20),
              Image(
                image: AssetImage('assets/images/logos/logo_ifv.png'),
                width: 90,
              ),
              SizedBox(width: 15),
              Image(
                image: AssetImage('assets/images/logos/logo_iam.png'),
                width: 140,
              ),
              SizedBox(width: 20, height: 60),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              '© 2024 ApeX Vigne',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
