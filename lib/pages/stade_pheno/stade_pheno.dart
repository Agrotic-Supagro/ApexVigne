import 'package:apex_vigne/pages/manage_session/widgets/card_apex_button.widget.dart';
import 'package:apex_vigne/shared_widgets/elevated_apex_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';

class StadePheno extends StatefulWidget {
  const StadePheno(
      {super.key, required this.title, this.selectedDate, this.noteText});
  final String title;
  final DateTime? selectedDate;
  final String? noteText;

  @override
  State<StadePheno> createState() => _StadePhenoState();
}

class _StadePhenoState extends State<StadePheno> {
  @override
  void initState() {
    super.initState();
  }

  void _showExitConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Quitter la session'),
          content: const Text('L\'observation ne sera pas sauvegarder'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: const Text('Annuler'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                Navigator.of(context).pop(); // Close the page
              },
              child: const Text('Confirmer'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Stade pheno page'),
        ]),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(widget.title),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          _showExitConfirmationDialog();
        },
      ),
    );
  }
}
