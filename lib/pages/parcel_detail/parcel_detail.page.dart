import 'package:apex_vigne/collections/parcel.collection.dart';
import 'package:apex_vigne/collections/session.collection.dart';
import 'package:apex_vigne/pages/create_session/create_session.page.dart';
import 'package:apex_vigne/pages/parcel_detail/widgets/ic_apex_cell.widget.dart';
import 'package:apex_vigne/services/auth.service.dart';
import 'package:apex_vigne/services/calculations.service.dart';
import 'package:apex_vigne/services/isar.service.dart';
import 'package:apex_vigne/services/sessions_api.service.dart';
import 'package:apex_vigne/shared_widgets/elevated_apex_button.widget.dart';
import 'package:apex_vigne/pages/parcel_detail/widgets/ic_apex_line_chart.widget.dart';
import 'package:apex_vigne/shared_widgets/label_apex_hydric_constraint.dart';
import 'package:apex_vigne/utils/format_date.dart';
import 'package:flutter/material.dart';
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
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              if (widget.sessions?.isNotEmpty ?? false)
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    height: 350,
                    child: IcApexLineChart(
                        sessions: widget.sessions!.reversed.toList())),
              const SizedBox(height: 20),
              if (widget.sessions?.isNotEmpty ?? false)
                _buildSessionsBoard(context),
              if (widget.sessions?.isEmpty ?? false)
                Text(
                  'Aucune session pour cette parcelle...',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2,
                      ),
                ),
              const SizedBox(height: 80),
            ],
          ),
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
    Future<dynamic> notesDialog(BuildContext context, String notes) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Notes'),
            content: Text(notes),
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
        columns: [
          const DataColumn(label: Text('Date')),
          const DataColumn(label: Text('iC-Apex')),
          const DataColumn(
              label: Text('C.H.'), tooltip: 'Contrainte hydrique (C.H.)'),
          DataColumn(
            label: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                widget.sessions!.length > 1
                    ? '${widget.sessions!.length} sessions'
                    : '1 session',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimary
                        .withOpacity(0.8)),
              ),
            ),
          ),
        ],
        dividerThickness: 0.0,
        columnSpacing: 15.0,
        dataRowMinHeight: 50.0,
        dataRowMaxHeight: 80.0,
        rows: widget.sessions?.map<DataRow>((session) {
              final double icApex = calculateIcApex(session.apexFullGrowth,
                  session.apexSlowerGrowth, session.apexStuntedGrowth);
              return DataRow(
                cells: [
                  DataCell(
                    Text(formatDate(session.sessionAt, explicit: true),
                        overflow: TextOverflow.ellipsis),
                  ),
                  DataCell(IcApexCell(icApex: icApex)),
                  DataCell(
                    LabelApexHydricConstraint(
                      text: calculateHydricConstraint(
                          session.apexFullGrowth,
                          session.apexSlowerGrowth,
                          session.apexStuntedGrowth,
                          icApex),
                    ),
                  ),
                  DataCell(
                    ElevatedApexButton(
                      icon: Icons.article_outlined,
                      callback: () {
                        notesDialog(context, session.notes);
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
    final AuthenticationService authService = AuthenticationService();

    Future<dynamic> prunedParcelDialog(BuildContext context) {
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
                onPressed: () async {
                  final session = Session()
                    ..sessionAt = DateTime.now().toIso8601String()
                    ..apexFullGrowth = 0
                    ..apexSlowerGrowth = 0
                    ..apexStuntedGrowth = 0
                    // TODO: Manage parcel without id
                    ..parcelId = widget.parcel.id!;
                  final bool isConnected =
                      await authService.checkConnection(context);
                  if (isConnected) {
                    await SessionsApiService().addSession(session);
                  } else {
                    await IsarService().saveSession(session);
                  }
                  setState(() {
                    widget.sessions!.add(session);
                    widget.sessions!.sort((a, b) => DateTime.parse(b.sessionAt)
                        .compareTo(DateTime.parse(a.sessionAt)));
                  });
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
            prunedParcelDialog(context),
          },
        ),
        const SizedBox(width: 20),
        ElevatedApexButton(
          text: 'Nouvelle Session',
          callback: () async {
            final Session? session = await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CreateSession(
                  title: 'Nouvelle session',
                  // TODO: Manage parcel without id
                  parcelId: widget.parcel.id!,
                ),
              ),
            );
            if (session != null) {
              setState(() {
                widget.sessions!.add(session);
                widget.sessions!.sort((a, b) => DateTime.parse(b.sessionAt)
                    .compareTo(DateTime.parse(a.sessionAt)));
              });
            }
          },
        ),
        const SizedBox(width: 60),
      ],
    );
  }
}
