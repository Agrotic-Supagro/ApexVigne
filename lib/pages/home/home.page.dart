import 'package:apex_vigne/collections/parcel.collection.dart';
import 'package:apex_vigne/collections/session.collection.dart';
import 'package:apex_vigne/pages/home/widgets/drawer_apex_vigne.widget.dart';
import 'package:apex_vigne/pages/parcel_detail/parcel_detail.page.dart';
import 'package:apex_vigne/services/calculations.service.dart';
import 'package:apex_vigne/services/isar.service.dart';
import 'package:apex_vigne/shared_widgets/label_apex_hydric_constraint.dart';
import 'package:apex_vigne/services/parcels_api.service.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final IsarService _isarService = IsarService();
  String _sortingOption = 'Du plus récent au plus ancien';

  Future<void> _showAddParcelDialog(BuildContext context) async {
    final TextEditingController parcelNameController =
        TextEditingController();
    final formKey = GlobalKey<FormState>();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Ajouter une parcelle'),
          content: Form(
            key: formKey,
            child: TextFormField(
              controller: parcelNameController,
              decoration: const InputDecoration(
                hintText: 'Nom de la parcelle',
                border: InputBorder.none,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer un nom de parcelle';
                }
                return null;
              },
            ),
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
                if (formKey.currentState!.validate()) {
                  // final Query<Parcel> parcels = _isarService.isar.parcels.buildQuery(filter: (parcel) => parcel.name 
                  final parcel = Parcel()
                    ..name = parcelNameController.text
                    ..ownerId = 'cd3ac534-a9f8-4879-9167-5411b981202d';
                  // parcels.findFirstSync();
                  // final Query<Parcel> parcel = Parcel()
                  //   ..name = parcelNameController.text
                    // ..ownerId = 'cd3ac534-a9f8-4879-9167-5411b981202d';
                  ParcelsApiService().addParcel(parcel);
                  // _isarService.isar.parcels.put(parcel);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Ajouter'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerApexVigne(),
      appBar: _buildAppBar(context),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/img/background_vine.png', // replace with the path to your image asset
              fit: BoxFit.cover,
            ),
          ),
          buildParcelsList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddParcelDialog(context);
        },
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Icon(Symbols.add, color: Theme.of(context).colorScheme.primary),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    /* Build */
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      title: const Center(
          child: Text('ApeX Vigne',
              style: TextStyle(fontWeight: FontWeight.w200))),
      actions: <Widget>[
        PopupMenuButton(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          icon: const Icon(Symbols.sort),
          onSelected: (selectedValue) {
            setState(() {
              _sortingOption = selectedValue;
            });
          },
          itemBuilder: (BuildContext context) {
            return [
              'Du plus récent au plus ancien',
              'Du plus ancien au plus récent',
              'Par ordre alphabétique',
              'Par ordre alphabétique inversé',
            ].map((String choice) {
              return PopupMenuItem(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        ),
      ],
    );
  }

  Center buildParcelsList() {
    /* Sort parcels */
    List<Parcel> sortParcels(List<Parcel> parcels, List<Session> sessions) {
      switch (_sortingOption) {
        case 'Par ordre alphabétique':
          parcels.sort((a, b) => a.name.compareTo(b.name));
          break;
        case 'Par ordre alphabétique inversé':
          parcels.sort((a, b) => b.name.compareTo(a.name));
          break;
        case 'Du plus récent au plus ancien':
          parcels.sort((a, b) {
            final aSessions =
                sessions.where((session) => session.parcelId == a.id).toList();
            final bSessions =
                sessions.where((session) => session.parcelId == b.id).toList();

            if ((aSessions.isEmpty) && (bSessions.isEmpty)) {
              return 0;
            } else if (aSessions.isEmpty) {
              return 1;
            } else if (bSessions.isEmpty) {
              return -1;
            }

          final aDate = aSessions
              .map((session) => session.sessionAt.isNotEmpty ? DateTime.parse(session.sessionAt) : DateTime(0))
              .reduce((max, element) => max.isAfter(element) ? max : element);
          final bDate = bSessions
              .map((session) => session.sessionAt.isNotEmpty ? DateTime.parse(session.sessionAt) : DateTime(0))
              .reduce((max, element) => max.isAfter(element) ? max : element);

            return bDate.compareTo(aDate);
          });
          break;
        case 'Du plus ancien au plus récent':
          parcels.sort((a, b) {
            final aSessions =
                sessions.where((session) => session.parcelId == a.id).toList();
            final bSessions =
                sessions.where((session) => session.parcelId == b.id).toList();

            if (aSessions.isEmpty && bSessions.isEmpty) {
              return 0;
            } else if (aSessions.isEmpty) {
              return 1;
            } else if (bSessions.isEmpty) {
              return -1;
            }

          final aDate = aSessions
              .map((session) => session.sessionAt.isNotEmpty ? DateTime.parse(session.sessionAt) : DateTime(0))
              .reduce((min, element) => min.isBefore(element) ? min : element);
          final bDate = bSessions
              .map((session) => session.sessionAt.isNotEmpty ? DateTime.parse(session.sessionAt) : DateTime(0))
              .reduce((min, element) => min.isBefore(element) ? min : element);

            return aDate.compareTo(bDate);
          });
          break;
      }
      return parcels;
    }

    /* Format date */
    String formatDate(String? timestamp) {
      if (timestamp == null || timestamp.isEmpty) {
        return '';
      }
      final date = DateTime.parse(timestamp);
      final formattedDate = DateFormat.MMMMd('fr').format(date);
      return formattedDate;
    }

    /* Build */
    return Center(
        child: FutureBuilder<List<dynamic>?>(
      future: Future.wait([_isarService.allParcels, _isarService.allSessions]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData) {
          return const Text('No parcel data available');
        }

        final List<dynamic> results = snapshot.data!;
        final List<Parcel> parcels = results[0];
        final List<Session> sessions = results[1];

        final List<Parcel> sortedParcels = sortParcels(parcels, sessions);

        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 35.0),
          itemCount: parcels.length,
          itemBuilder: (context, index) {
            final currentParcel = sortedParcels[index];
            final currentSessionsParcel = sessions
                .where((session) => session.parcelId == currentParcel.id)
                .toList();
            String lastSession = '';
            double icApex = 0;
            currentSessionsParcel.sort((a, b) {
              final aDate = DateTime.parse(a.sessionAt);
              final bDate = DateTime.parse(b.sessionAt);
              return bDate.compareTo(aDate);
            });
            if (currentSessionsParcel.isNotEmpty) {
              lastSession =
                  'Dernière observation le ${formatDate(currentSessionsParcel.first.sessionAt)}';
              icApex = calculateIcApex(currentSessionsParcel.first.apexFullGrowth, currentSessionsParcel.first.apexSlowerGrowth, currentSessionsParcel.first.apexStuntedGrowth);
            }
            return Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30.0),
                  title: Text(currentParcel.name,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w600)),
                  subtitle: Text(lastSession,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary)),
                  trailing: lastSession.isNotEmpty
                      ? LabelApexHydricConstraint(
                          text: calculateHydricConstraint(currentSessionsParcel.first.apexFullGrowth, currentSessionsParcel.first.apexSlowerGrowth, currentSessionsParcel.first.apexStuntedGrowth, icApex))
                      : null,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return ParcelDetailPage(
                          parcel: currentParcel,
                          sessions: currentSessionsParcel,
                        );
                      },
                    ));
                  },
                ),
                if (index != parcels.length - 1)
                  Divider(
                    color: Colors.grey.shade100,
                    indent: 30.0,
                    endIndent: 30.0,
                    height: 10.0,
                  ),
              ],
            );
          },
        );
      },
    ));
  }
}
