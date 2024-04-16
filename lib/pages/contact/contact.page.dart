import 'package:apex_vigne/shared_widgets/elevated_apex_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(AppLocalizations.of(context)!.titleContact),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildBodyField(context),
            const SizedBox(height: 20),
            const SendButton(),
          ],
        ),
      ),
    );
  }

  Expanded _buildBodyField(BuildContext context) {
    /* Build */
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Color(0xFFF5F5F5),
        ),
        child: TextField(
          autofocus: true,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: InputDecoration(
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            hintText: AppLocalizations.of(context)!.hintWriteMessage,
          ),
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(letterSpacing: 1.2, color: Colors.grey[700]),
        ),
      ),
    );
  }
}

class SendButton extends StatelessWidget {
  const SendButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ElevatedApexButton(
        callback: () {
          // TODO: Send message with the endpoint /contact
          // @param email The email of the user
          // @param message The message to send
        },
        text: AppLocalizations.of(context)!.actionSend,
      ),
    );
  }
}
