import 'package:apex_vigne/collections/parcel.collection.dart';
import 'package:apex_vigne/collections/session.collection.dart';
import 'package:apex_vigne/pages/create_update_session/create_update_session.page.dart';
import 'package:apex_vigne/shared_widgets/elevated_apex_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';

class ParcelDetailPage extends StatefulWidget {
  final Parcel parcel;
  final List<Session>? sessions;

  const ParcelDetailPage(
      {super.key, required this.parcel, required this.sessions});

  @override
  State<ParcelDetailPage> createState() => _ParcelDetailPageState();
}

class _ParcelDetailPageState extends State<ParcelDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(widget.parcel.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildSessionsBoard(context),
          ],
        ),
      ),
      floatingActionButton: buildFloatingActionButton(context),
    );
  }

  DataTable buildSessionsBoard(BuildContext context) {
    // TODO: Déplacer dans un service
    String _formatDate(String timestamp) {
      final date = DateTime.parse(timestamp);
      final formattedDate = DateFormat.MMMMd('fr').format(date);
      return formattedDate;
    }

    // TODO: Déplacer dans un service
    double calculateIcApex(
        int apexFullGrowth, int apexSlowerGrowth, int apexStuntedGrowth) {
      int sumApex = apexFullGrowth + apexSlowerGrowth + apexStuntedGrowth;
      return (apexFullGrowth + (apexSlowerGrowth / 2)) / sumApex;
    }

    // TODO: Déplacer dans un service
    String calculateHydricConstraint(int apexFullGrowth, int apexSlowerGrowth,
        int apexStuntedGrowth, isPruned) {
      int sumApex = apexFullGrowth + apexSlowerGrowth + apexStuntedGrowth;
      double moyenne = calculateIcApex(apexFullGrowth, apexSlowerGrowth, apexStuntedGrowth);
      double tauxApexFullGrowth = apexFullGrowth / sumApex * 100;
      double tauxApexStuntedGrowth = apexStuntedGrowth / sumApex * 100;
      // TODO: A voir si on garde le ifvClasse
      int ifvClasse = -1;

      if (isPruned) {
        ifvClasse = 4;
        return 'Ecimée';
      }
      if (moyenne >= 0.75) {
        ifvClasse = 0;
        return 'Absente';
      } else if (tauxApexFullGrowth >= 5) {
        ifvClasse = 1;
        return 'Faible';
      } else if (tauxApexStuntedGrowth <= 90) {
        ifvClasse = 2;
        return 'Modérée';
      }
      ifvClasse = 3;
      return 'Sévère';
    }

    Future<dynamic> showNoteDialog(BuildContext context) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Note'),
            content: const Text(
                'La contrainte hydrique est calculée à partir de la moyenne des iC-Apex. '
                'Si la parcelle est écimée, la contrainte hydrique est égale à "Ecimée".'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Fermer'),
              ),
            ],
          );
        },
      );
    }

    return DataTable(
      columns: const [
        DataColumn(label: Text('Date')),
        DataColumn(label: Text('iC-Apex')),
        DataColumn(label: Text('C.H.'), tooltip: 'Contrainte hydrique (C.H.)'),
        DataColumn(label: Text('')),
      ],
      rows: widget.sessions?.map<DataRow>((session) {
            return DataRow(
              cells: [
                DataCell(Text(_formatDate(session.sessionDate))),
                DataCell(Text(calculateIcApex(48, 3, 1).toStringAsFixed(2))),
                DataCell(Text(calculateHydricConstraint(48, 3, 1, false))),
                DataCell(
                  Container(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    padding: const EdgeInsets.all(8),
                    child: IconButton(
                      icon: Icon(Icons.article, color: Theme.of(context).colorScheme.primary),
                      onPressed: () {
                        showNoteDialog(context);
                      },
                    ),
                  ),
                ),
              ],
            );
          }).toList() ??
          [],
    );
  }

  Row buildFloatingActionButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedApexButton(icon: Symbols.cut, callback: () => {}),
        const SizedBox(width: 10),
        ElevatedApexButton(
          text: 'Nouvelle Session',
          callback: () => {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const CreateUpdateSession(
                title: 'Nouvelle session',
              ),
            ))
          },
        ),
      ],
    );
  }
}
