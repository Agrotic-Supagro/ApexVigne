import 'package:apex_vigne/collections/parcel.collection.dart';
import 'package:apex_vigne/collections/session.collection.dart';
import 'package:apex_vigne/pages/home/widgets/drawer_apex_vigne.widget.dart';
import 'package:apex_vigne/pages/parcel_detail/parcel_detail.page.dart';
import 'package:apex_vigne/services/isar.service.dart';
import 'package:flutter/material.dart';
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

  List<Parcel> _sortParcels(List<Parcel> parcels, List<Session> sessions) {
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

          if ((aSessions.isEmpty) &&
              (bSessions.isEmpty)) {
            return 0;
          } else if (aSessions.isEmpty) {
            return 1;
          } else if (bSessions.isEmpty) {
            return -1;
          }

          final aDate = aSessions
              .map((session) => session.sessionDate.isNotEmpty ? DateTime.parse(session.sessionDate) : DateTime(0))
              .reduce((max, element) => max.isAfter(element) ? max : element);
          final bDate = bSessions
              .map((session) => session.sessionDate.isNotEmpty ? DateTime.parse(session.sessionDate) : DateTime(0))
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
              .map((session) => session.sessionDate.isNotEmpty ? DateTime.parse(session.sessionDate) : DateTime(0))
              .reduce((min, element) => min.isBefore(element) ? min : element);
          final bDate = bSessions
              .map((session) => session.sessionDate.isNotEmpty ? DateTime.parse(session.sessionDate) : DateTime(0))
              .reduce((min, element) => min.isBefore(element) ? min : element);

          return aDate.compareTo(bDate);
        });
        break;
    }
    return parcels;
  }

  String _formatDate(String? timestamp) {
    if (timestamp == null || timestamp.isEmpty) {
      return '';
    }
    final date = DateTime.parse(timestamp);
    final formattedDate = DateFormat.MMMMd('fr').format(date);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerApexVigne(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text('ApeX Vigne'),
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
      ),
      body: Center(
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

          final List<Parcel> sortedParcels = _sortParcels(parcels, sessions);

          return ListView.builder(
            itemCount: parcels.length,
            itemBuilder: (context, index) {
              final currentParcel = sortedParcels[index];
              final currentSessionsParcel = sessions
                  .where((session) => session.parcelId == currentParcel.id)
                  .toList();
              String lastSession = '';
              currentSessionsParcel.sort((a, b) {
                final aDate = DateTime.parse(a.sessionDate);
                final bDate = DateTime.parse(b.sessionDate);
                return bDate.compareTo(aDate);
              });
              if (currentSessionsParcel.isNotEmpty) {
                lastSession = 'Dernière observation le ${_formatDate(currentSessionsParcel.first.sessionDate)}';
              }
              return ListTile(
                title: Text(currentParcel.name),
                subtitle: Text(lastSession),
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
              );
            },
          );
        },
      )),
    );
  }
}
