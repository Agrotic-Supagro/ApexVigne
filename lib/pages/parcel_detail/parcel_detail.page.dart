import 'package:apex_vigne/collections/parcel.collection.dart';
import 'package:apex_vigne/collections/session.collection.dart';
import 'package:apex_vigne/pages/create_update_session/create_update_session.page.dart';
import 'package:apex_vigne/pages/parcel_detail/widgets/ic_apex_cell.widget.dart';
import 'package:apex_vigne/services/calculations.service.dart';
import 'package:apex_vigne/shared_widgets/elevated_apex_button.widget.dart';
import 'package:apex_vigne/pages/parcel_detail/widgets/ic_apex_line_chart.widget.dart';
import 'package:apex_vigne/shared_widgets/label_apex_hydric_constraint.dart';
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
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            if (widget.sessions?.isNotEmpty ?? false)
              SizedBox(
                  width: 350,
                  height: 350,
                  child: IcApexLineChart(sessions: widget.sessions!)),
            const SizedBox(height: 20),
            if (widget.sessions?.isNotEmpty ?? false)
              _buildSessionsBoard(context),
            if (widget.sessions?.isEmpty ?? false)
              Center(
                child: Text('Aucune session pour cette parcelle...',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                        )),
              ),
          ],
        ),
      ),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    /* Build */
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      title: Text(widget.parcel.name),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  Theme _buildSessionsBoard(BuildContext context) {
    String formatDate(String timestamp) {
      final date = DateTime.parse(timestamp);
      final formattedDate = DateFormat.MMMMd('fr').format(date);
      return formattedDate;
    }

    Future<dynamic> showNotesDialog(BuildContext context) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Notes'),
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

    /* Build */
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Date')),
          DataColumn(label: Text('iC-Apex')),
          DataColumn(
              label: Text('C.H.'), tooltip: 'Contrainte hydrique (C.H.)'),
          DataColumn(label: Text('')),
        ],
        dividerThickness: 0.0,
        columnSpacing: 15.0,
        dataRowMinHeight: 50.0,
        dataRowMaxHeight: 80.0,
        rows: widget.sessions?.map<DataRow>((session) {
              final double icApex = calculateIcApex(session.apexFullGrowth, session.apexSlowerGrowth, session.apexStuntedGrowth);
              return DataRow(
                cells: [
                  DataCell(Text(formatDate(session.sessionAt),
                      overflow: TextOverflow.ellipsis)),
                  DataCell(IcApexCell(icApex: icApex)),
                  DataCell(LabelApexHydricConstraint(
                      text: calculateHydricConstraint(
                          session.apexFullGrowth, session.apexSlowerGrowth, session.apexStuntedGrowth, icApex))),
                  DataCell(
                    ElevatedApexButton(
                      icon: Icons.article_outlined,
                      callback: () {
                        showNotesDialog(context);
                      },
                    ),
                  ),
                ],
              );
            }).toList() ??
            [],
      ),
    );
  }

  Row _buildFloatingActionButton(BuildContext context) {
    Future<dynamic> showPrunedParcelDialog(BuildContext context) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Écimer la parcelle'),
            content:
                const Text('Êtes-vous sûr de vouloir écimer la parcelle ?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Annuler'),
              ),
              TextButton(
                onPressed: () {
                  // TODO: Créer une nouvelle session avec les apex à 0
                  Navigator.of(context).pop();
                },
                child: const Text('Confirmer'),
              ),
            ],
          );
        },
      );
    }

    /* Build */
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedApexButton(
          icon: Symbols.cut,
          callback: () => {
            showPrunedParcelDialog(context),
          },
        ),
        const SizedBox(width: 20),
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
        const SizedBox(width: 60),
      ],
    );
  }
}
