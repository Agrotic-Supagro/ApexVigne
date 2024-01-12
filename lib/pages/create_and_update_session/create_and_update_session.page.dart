import 'package:apex_vigne/collections/session.collection.dart';
import 'package:apex_vigne/constants.dart';
import 'package:apex_vigne/pages/create_and_update_session/widgets/card_apex_button.widget.dart';
import 'package:apex_vigne/pages/stade_pheno/stade_pheno.dart';
import 'package:apex_vigne/services/auth.service.dart';
import 'package:apex_vigne/services/isar.service.dart';
import 'package:apex_vigne/services/sessions_api.service.dart';
import 'package:apex_vigne/shared_widgets/elevated_apex_button.widget.dart';
import 'package:apex_vigne/utils/determine_position.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:vibration/vibration.dart';

class CreateUpdateSession extends StatefulWidget {
  const CreateUpdateSession({
    super.key,
    required this.title,
    required this.parcelId,
    this.selectedDate,
    this.noteText,
  });

  final String title;
  final String parcelId;
  final DateTime? selectedDate;
  final String? noteText;

  @override
  State<CreateUpdateSession> createState() => _CreateUpdateSessionState();
}

class _CreateUpdateSessionState extends State<CreateUpdateSession> {
  final List<int> _counts = [0, 0, 0];
  final List<int> _countsHistory = [];
  bool _positionSaved = false;
  late Position _position;
  late DateTime _selectedDate;
  late String _notesText;
  int _stadeId = -1;

  @override
  void initState() {
    _selectedDate = widget.selectedDate ?? DateTime.now();
    _notesText = widget.noteText ?? '';
    _checkLocation();
    super.initState();
  }

  void _checkLocation() async {
    await determinePosition().then((value) {
      _position = value;
    }).catchError((error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Symbols.location_off, color: Colors.white),
                const SizedBox(width: 20),
                Expanded(
                  child: Text(error),
                ),
              ],
            ),
            backgroundColor: const Color(0xFFCCB152),
          ),
        );
        Navigator.of(context).pop();
      }
    });
  }

  void _exitConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Quitter la session'),
          content: const Text('La session ne sera pas sauvegardée'),
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
    /*
      WillPopScope is used to prevent the user from leaving the page
      We should use PopScope because WillPopScope is deprecated but PopScope is actually bugged
      So we use WillPopScope until PopScope is fixed
      https://github.com/flutter/flutter/issues/138624
    */
    return WillPopScope(
      onWillPop: () async {
        _exitConfirmationDialog();
        return false;
      },
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                _buildOutlinedButtons(),
                const SizedBox(height: 30),
                _buildCardApexButtons(),
                const SizedBox(height: 15),
                _buildBottomSection(),
              ]),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    /* Build */
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      title: Text(widget.title),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          _exitConfirmationDialog();
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

    /* Build */
    return Expanded(
      flex: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {
                selectDate(context);
              },
              label: Text(DateFormat.MMMMd('fr').format(_selectedDate)),
              icon: const Icon(Symbols.date_range),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: OutlinedButton(
              onPressed: () async {
                final selectedStadeId = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const StadePheno();
                    },
                  ),
                );
                if (selectedStadeId != null) {
                  setState(() {
                    _stadeId = selectedStadeId;
                  });
                }
              },
              child: Text(
                _stadeId == -1
                    ? 'Choix du stade'
                    : stadesPheno[_stadeId]['name'],
                style: const TextStyle(overflow: TextOverflow.ellipsis),
              ),
            ),
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
        if (_countsHistory.length > 14 && !_positionSaved) {
          _positionSaved = true;
        }
      });
    }

    void editCount(int buttonIndex) {
      final TextEditingController countController = TextEditingController();
      countController.text = _counts[buttonIndex].toString();
      Vibration.vibrate(duration: 10);

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Éditer le nombre'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: countController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Nombre', border: InputBorder.none),
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
                  final newCount = int.tryParse(countController.text);
                  if (newCount != null) {
                    setState(() {
                      _counts[buttonIndex] = newCount;
                    });
                  }
                  Navigator.of(context).pop();
                },
                child: const Text('Sauvegarder'),
              ),
            ],
          );
        },
      );
    }

    /* Build */
    return Expanded(
      child: Column(
        children: <Widget>[
          CardApexButton(
            imgPath: 'assets/images/full_growth.jpg',
            text: 'Pleine croissance',
            onPressed: () async {
              incrementCount(2);
              Vibration.vibrate(duration: 300);
            },
            onLongPressed: () {
              editCount(2);
            },
            count: _counts[2],
          ),
          const SizedBox(height: 10),
          CardApexButton(
            imgPath: 'assets/images/slower_growth.jpg',
            text: 'Croissance ralentie',
            onPressed: () async {
              incrementCount(1);
              Vibration.vibrate(duration: 150);
            },
            onLongPressed: () {
              editCount(1);
            },
            count: _counts[1],
          ),
          const SizedBox(height: 10),
          CardApexButton(
            imgPath: 'assets/images/stunted_growth.jpg',
            text: 'Arrêt de croissance',
            onPressed: () async {
              incrementCount(0);
              Vibration.vibrate(duration: 40);
            },
            onLongPressed: () {
              editCount(0);
            },
            count: _counts[0],
          ),
        ],
      ),
    );
  }

  Expanded _buildBottomSection() {
    final AuthenticationService authService = AuthenticationService();

    void editNotesDialog() {
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

    void undoLastAction() {
      if (_countsHistory.isNotEmpty) {
        Vibration.vibrate(duration: 10);
        int lastCount = _countsHistory.removeLast();
        setState(() {
          _counts[lastCount]--;
        });
      }
    }

    void addSession() async {
      final session = Session()
        ..sessionAt = _selectedDate.toIso8601String()
        ..apexStuntedGrowth = _counts[0]
        ..apexSlowerGrowth = _counts[1]
        ..apexFullGrowth = _counts[2]
        ..parcelId = widget.parcelId
        ..notes = _notesText
        ..stadePhenoId = _stadeId;
      if (_positionSaved) {
        session.latitude = _position.latitude;
        session.longitude = _position.longitude;
      } else {
        session.latitude = 0;
        session.longitude = 0;
      }
      final bool isConnected = await authService.checkConnection(context);
      if (isConnected) {
        await SessionsApiService().addSession(session);
      } else {
        await IsarService().saveSession(session);
      }
      if (context.mounted) {
        Navigator.of(context).pop(session);
      }
    }

    /* Build */
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
              '${_counts.reduce((firstValue, secondValue) => firstValue + secondValue)}/50',
              style: const TextStyle(letterSpacing: 1.5),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedApexButton(
                icon: Symbols.undo,
                callback: _countsHistory.isEmpty ? null : undoLastAction,
              ),
              const SizedBox(width: 10),
              ElevatedApexButton(
                text: 'Terminer la session',
                callback: _counts.reduce((firstValue, secondValue) =>
                            firstValue + secondValue) <
                        50
                    ? null
                    : addSession,
              ),
              const SizedBox(width: 10),
              ElevatedApexButton(
                icon: Symbols.article,
                callback: () {
                  editNotesDialog();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
