import 'package:apex_vigne/pages/create_update_session/widgets/card_apex_button.widget.dart';
import 'package:apex_vigne/shared_widgets/elevated_apex_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';

class CreateUpdateSession extends StatefulWidget {
  const CreateUpdateSession(
      {super.key, required this.title, this.selectedDate, this.noteText});
  final String title;
  final DateTime? selectedDate;
  final String? noteText;

  @override
  State<CreateUpdateSession> createState() => _CreateUpdateSessionState();
}

class _CreateUpdateSessionState extends State<CreateUpdateSession> {
  final List<int> _counts = [0, 0, 0];
  final List<int> _countsHistory = [];
  late DateTime _selectedDate;
  late String _notesText;

  @override
  void initState() {
    _selectedDate = widget.selectedDate ?? DateTime.now();
    _notesText = widget.noteText ?? '';
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
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
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
    Future<void> selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );
      if (picked != null && picked != _selectedDate) {
        setState(() {
          _selectedDate = picked;
        });
      }
    }

    return Expanded(
      flex: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          OutlinedButton.icon(
            onPressed: () {
              selectDate(context);
            },
            label: Text(DateFormat.MMMMd('fr').format(_selectedDate)),
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
    void incrementCount(int buttonIndex) {
      setState(() {
        _counts[buttonIndex]++;
        _countsHistory.add(buttonIndex);
      });
    }

    return Expanded(
      child: Column(
        children: <Widget>[
          CardApexButton(
              imgPath: 'assets/img/full_growth.jpg',
              text: 'Pleine croissance',
              onPressed: () {
                incrementCount(0);
              },
              onLongPressed: () {},
              count: _counts[0]),
          const SizedBox(height: 10),
          CardApexButton(
              imgPath: 'assets/img/slower_growth.jpg',
              text: 'Croissance ralentie',
              onPressed: () {
                incrementCount(1);
              },
              onLongPressed: () {},
              count: _counts[1]),
          const SizedBox(height: 10),
          CardApexButton(
              imgPath: 'assets/img/stunted_growth.jpg',
              text: 'Arrêt de croissance',
              onPressed: () {
                incrementCount(2);
              },
              onLongPressed: () {},
              count: _counts[2]),
        ],
      ),
    );
  }

  Expanded _buildBottomSection() {
    void undoLastAction() {
      if (_countsHistory.isNotEmpty) {
        setState(() {
          _counts[_countsHistory.removeLast()]--;
        });
      }
    }

    void showEditNotesDialog() {
      final TextEditingController notesController = TextEditingController();
      notesController.text = _notesText;

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Notes'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: notesController,
                  maxLines: null,
                  decoration: const InputDecoration(
                      hintText: 'Écrivez ici...', border: InputBorder.none),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Annuler'),
              ),
              TextButton(
                onPressed: () {
                  _notesText = notesController.text;
                  Navigator.of(context).pop();
                },
                child: const Text('Sauvegarder'),
              ),
            ],
          );
        },
      );
    }

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
                          undoLastAction();
                        }),
              const SizedBox(width: 10),
              ElevatedApexButton(
                  text: 'Terminer la session',
                  callback: _countsHistory.length < 50 ? null : () {}),
              const SizedBox(width: 10),
              ElevatedApexButton(
                  icon: Symbols.article,
                  callback: () {
                    showEditNotesDialog();
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
