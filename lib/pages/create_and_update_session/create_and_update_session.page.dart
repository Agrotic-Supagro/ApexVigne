import 'package:apex_vigne/collections/session.collection.dart';
import 'package:apex_vigne/constants.dart';
import 'package:apex_vigne/pages/create_and_update_session/widgets/card_apex_button.widget.dart';
import 'package:apex_vigne/pages/stade_pheno/stade_pheno.dart';
import 'package:apex_vigne/services/auth.service.dart';
import 'package:apex_vigne/services/isar.service.dart';
import 'package:apex_vigne/services/sessions_api.service.dart';
import 'package:apex_vigne/shared_widgets/elevated_apex_button.widget.dart';
import 'package:apex_vigne/utils/determine_device_info.dart';
import 'package:apex_vigne/utils/determine_position.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:vibration/vibration.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateUpdateSession extends StatefulWidget {
  const CreateUpdateSession({
    super.key,
    required this.title,
    required this.parcelId,
    this.session,
  });

  final String title;
  final String parcelId;
  final Session? session;

  @override
  State<CreateUpdateSession> createState() => _CreateUpdateSessionState();
}

class _CreateUpdateSessionState extends State<CreateUpdateSession> {
  final List<int> _counts = [0, 0, 0];
  final List<int> _countsHistory = [];
  late Position _position;
  bool _positionSaved = false;
  DateTime _selectedDate = DateTime.now();
  String _notesText = '';
  int _stadeIndex = -1;

  @override
  void initState() {
    _initSessionEditing();
    _checkLocation();
    super.initState();
  }

  void _initSessionEditing() {
    if (widget.session != null) {
      _stadeIndex = stadesPheno.indexWhere(
          (element) => element['id'] == widget.session!.stadePhenoId);
      _selectedDate = DateFormat('EEE, dd MMM yyyy HH:mm:ss')
          .parse(widget.session!.sessionAt);
      _notesText = widget.session?.notes ?? '';
      _counts[0] = widget.session!.apexFullGrowth;
      _counts[1] = widget.session!.apexSlowerGrowth;
      _counts[2] = widget.session!.apexStuntedGrowth;
    }
  }

  void _checkLocation() async {
    await determinePosition(context).then((value) {
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
          title: Text(AppLocalizations.of(context)!.titleLeaveSession),
          content: Text(AppLocalizations.of(context)!.infoExitSession),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text(AppLocalizations.of(context)!.actionCancel),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                Navigator.of(context).pop(); // Close the page
              },
              child: Text(AppLocalizations.of(context)!.actionConfirm),
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
                    _stadeIndex = selectedStadeId;
                  });
                }
              },
              child: Text(
                _stadeIndex == -1
                    ? AppLocalizations.of(context)!.infoChoiceStade
                    : stadesPheno[_stadeIndex]['name'],
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
            title: Text(AppLocalizations.of(context)!.titleEditNumber),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: countController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.infoNumber,
                    border: InputBorder.none,
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(AppLocalizations.of(context)!.actionCancel),
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
                child: Text(AppLocalizations.of(context)!.actionSave),
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
            text: AppLocalizations.of(context)!.actionFullGrowth,
            onPressed: () async {
              incrementCount(0);
              Vibration.vibrate(duration: 300);
            },
            onLongPressed: () {
              editCount(0);
            },
            count: _counts[0],
          ),
          const SizedBox(height: 10),
          CardApexButton(
            imgPath: 'assets/images/slower_growth.jpg',
            text: AppLocalizations.of(context)!.actionSlowerGrowth,
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
            text: AppLocalizations.of(context)!.actionStuntedGrowth,
            onPressed: () async {
              incrementCount(2);
              Vibration.vibrate(duration: 40);
            },
            onLongPressed: () {
              editCount(2);
            },
            count: _counts[2],
          ),
        ],
      ),
    );
  }

  Expanded _buildBottomSection() {
    void editNotesDialog() {
      final TextEditingController notesController = TextEditingController();
      notesController.text = _notesText;

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(AppLocalizations.of(context)!.titleNotes),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: notesController,
                  maxLines: null,
                  decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.hintWriteHere,
                      border: InputBorder.none),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(AppLocalizations.of(context)!.actionCancel),
              ),
              TextButton(
                onPressed: () {
                  _notesText = notesController.text;
                  Navigator.of(context).pop();
                },
                child: Text(AppLocalizations.of(context)!.actionSave),
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
      final List<String> deviceInfo = await determineDeviceInfo();
      final session = Session()
        ..sessionAt = _selectedDate.toIso8601String()
        ..apexFullGrowth = _counts[0]
        ..apexSlowerGrowth = _counts[1]
        ..apexStuntedGrowth = _counts[2]
        ..parcelId = widget.parcelId
        ..notes = _notesText
        ..stadePhenoId = stadesPheno[_stadeIndex]['id']
        ..deviceHardware = deviceInfo[0]
        ..deviceSoftware = deviceInfo[1];
      if (_positionSaved) {
        session.latitude = _position.latitude;
        session.longitude = _position.longitude;
        session.inField = 1;
      } else {
        session.latitude = 0;
        session.longitude = 0;
        session.inField = 0;
      }
      final bool isConnected =
          await AuthenticationService().checkConnection(context);
      if (isConnected) {
        if (widget.session != null) {
          session.id = widget.session!.id;
          session.isarId = widget.session!.isarId;
          session.latitude = widget.session!.latitude;
          session.longitude = widget.session!.longitude;
          await SessionsApiService().updateSession(session);
        } else {
          await SessionsApiService().addSession(session);
        }
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
                text: AppLocalizations.of(context)!.actionValidateSession,
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
