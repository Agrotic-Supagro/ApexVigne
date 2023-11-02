import 'package:apex_vigne/pages/new_session/widgets/card_apex_button.widget.dart';
import 'package:apex_vigne/shared_widgets/elevated_apex_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';

class NewSession extends StatefulWidget {
  const NewSession({super.key, required this.title});
  final String title;

  @override
  State<NewSession> createState() => _NewSessionState();
}

class _NewSessionState extends State<NewSession> {
  final List<int> _counts = [0, 0, 0];
  final List<int> _countsHistory = [];

  void _incrementCount(int buttonIndex) {
    setState(() {
      _counts[buttonIndex]++;
      _countsHistory.add(buttonIndex);
    });
  }

  void _undoLastAction() {
    if (_countsHistory.isNotEmpty) {
      setState(() {
        _counts[_countsHistory.removeLast()]--;
      });
    }
  }

  String _formatDate(String timestamp) {
    final date = DateTime.parse(timestamp);
    final formattedDate = DateFormat.MMMMd('fr').format(date);
    return formattedDate;
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          _buildOutlinedButtons(),
          const SizedBox(height: 30),
          _buildCardApexButtons(),
          const SizedBox(height: 15),
          _buildBottomSection(),
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

  Expanded _buildOutlinedButtons() {
    return Expanded(
      flex: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          OutlinedButton.icon(
            onPressed: () {},
            label: const Text('Sélectionner une date'),
            icon: const Icon(Symbols.date_range),
          ),
          const SizedBox(width: 10),
          OutlinedButton(
            onPressed: () {},
            child: const Text('Choix du stade'),
          ),
        ],
      ),
    );
  }

  Expanded _buildCardApexButtons() {
    return Expanded(
      child: Column(
        children: <Widget>[
          CardApexButton(
              imgPath: 'assets/img/full_growth.jpg',
              text: 'Pleine croissance',
              onPressed: () {
                _incrementCount(0);
              },
              onLongPressed: () {},
              count: _counts[0]),
          const SizedBox(height: 10),
          CardApexButton(
              imgPath: 'assets/img/slower_growth.jpg',
              text: 'Croissance ralentie',
              onPressed: () {
                _incrementCount(1);
              },
              onLongPressed: () {},
              count: _counts[1]),
          const SizedBox(height: 10),
          CardApexButton(
              imgPath: 'assets/img/stunted_growth.jpg',
              text: 'Arrêt de croissance',
              onPressed: () {
                _incrementCount(2);
              },
              onLongPressed: () {},
              count: _counts[2]),
        ],
      ),
    );
  }

  Expanded _buildBottomSection() {
    return Expanded(
      flex: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.shade100),
            child: Text(
              '${_countsHistory.length}/50',
              style: const TextStyle(letterSpacing: 1.5),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedApexButton(
                  icon: Symbols.undo,
                  callback: _countsHistory.isEmpty
                      ? null
                      : () {
                          _undoLastAction();
                        }),
              const SizedBox(width: 10),
              ElevatedApexButton(
                  text: 'Terminer la session',
                  callback: _countsHistory.length < 50 ? null : () {}),
              const SizedBox(width: 10),
              ElevatedApexButton(icon: Symbols.article, callback: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
