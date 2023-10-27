import 'package:apex_vigne/models/parcel.model.dart';
import 'package:apex_vigne/models/session.model.dart';
import 'package:apex_vigne/pages/parcel_detail/parcel_detail.page.dart';
import 'package:flutter/material.dart';
import 'package:apex_vigne/pages/profil/profil.page.dart';
import 'package:apex_vigne/services/server_api.service.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ServerApiService _apiService = ServerApiService();
  List<Session>? _sessions;
  String _sortingOption = 'Du plus récent au plus ancien';

  Future<List<Parcel>?> _fetchParcelData() async {
    try {
      return await _apiService.retrieveUserData('parcelle') as List<Parcel>;
    } catch (e) {
      debugPrint('Error fetching parcel data: $e');
      return null;
    }
  }

  void _fetchSessionsData() async {
    try {
      _sessions =
          await _apiService.retrieveUserData('session') as List<Session>;
    } catch (e) {
      debugPrint('Error fetching parcel data: $e');
    }
  }

  List<Parcel> _sortParcels(List<Parcel> parcels) {
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
              _sessions?.where((session) => session.parcelId == a.id).toList();
          final bSessions =
              _sessions?.where((session) => session.parcelId == b.id).toList();

          if ((aSessions == null || aSessions.isEmpty) &&
              (bSessions == null || bSessions.isEmpty)) {
            return 0;
          } else if (aSessions == null || aSessions.isEmpty) {
            return 1;
          } else if (bSessions == null || bSessions.isEmpty) {
            return -1;
          }

          final aDate = aSessions
              .map((session) => DateTime.parse(session.sessionDate))
              .reduce((max, element) => max.isAfter(element) ? max : element);
          final bDate = bSessions
              .map((session) => DateTime.parse(session.sessionDate))
              .reduce((max, element) => max.isAfter(element) ? max : element);

          return bDate.compareTo(aDate);
        });
        break;
      case 'Du plus ancien au plus récent':
        parcels.sort((a, b) {
          final aSessions =
              _sessions?.where((session) => session.parcelId == a.id).toList();
          final bSessions =
              _sessions?.where((session) => session.parcelId == b.id).toList();

          if (aSessions!.isEmpty && bSessions!.isEmpty) {
            return 0;
          } else if (aSessions.isEmpty) {
            return 1;
          } else if (bSessions!.isEmpty) {
            return -1;
          }

          final aDate = aSessions
              .map((session) => DateTime.parse(session.sessionDate))
              .reduce((min, element) => min.isBefore(element) ? min : element);
          final bDate = bSessions
              .map((session) => DateTime.parse(session.sessionDate))
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
    _fetchSessionsData();
    return Scaffold(
      drawer: const DrawerApexVigne(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Apex Vigne'),
        actions: <Widget>[
          PopupMenuButton(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            icon: const Icon(Symbols.tune),
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
          child: FutureBuilder<List<Parcel>?>(
        future: _fetchParcelData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData) {
            return const Text('No parcel data available');
          }

          final parcel = snapshot.data!;

          return ListView.builder(
            itemCount: parcel.length,
            itemBuilder: (context, index) {
              final sortedParcels = _sortParcels(parcel);
              final currentParcel = sortedParcels[index];
              final currentSessionsParcel = _sessions
                  ?.where((session) => session.parcelId == currentParcel.id)
                  .toList();
              currentSessionsParcel?.sort((a, b) {
                final aDate = DateTime.parse(a.sessionDate);
                final bDate = DateTime.parse(b.sessionDate);
                return bDate.compareTo(aDate);
              });
              final String lastSession = currentSessionsParcel!.isNotEmpty
                  ? 'Dernière observation le ${_formatDate(currentSessionsParcel.first.sessionDate)}'
                  : '';
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

class DrawerApexVigne extends StatelessWidget {
  const DrawerApexVigne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            child: const Text('Menu'),
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const ProfilPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
