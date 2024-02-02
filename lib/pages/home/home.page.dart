import 'package:apex_vigne/collections/parcel.collection.dart';
import 'package:apex_vigne/collections/session.collection.dart';
import 'package:apex_vigne/pages/home/widgets/drawer_apex_vigne.widget.dart';
import 'package:apex_vigne/pages/parcel_detail/parcel_detail.page.dart';
import 'package:apex_vigne/services/auth.service.dart';
import 'package:apex_vigne/services/calculations.service.dart';
import 'package:apex_vigne/services/isar.service.dart';
import 'package:apex_vigne/services/navigation.service.dart';
import 'package:apex_vigne/shared_widgets/label_apex_hydric_constraint.dart';
import 'package:apex_vigne/services/parcels_api.service.dart';
import 'package:apex_vigne/shared_widgets/offline_dialog.dart';
import 'package:apex_vigne/utils/determine_position.dart';
import 'package:apex_vigne/utils/format_date.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _sortingOption =
      AppLocalizations.of(NavigationService.navigatorKey.currentContext!)!
          .sortByMostRecent;
  Position? _position;

  @override
  void initState() {
    _checkLocation();
    super.initState();
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
      }
    });
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
              'assets/images/background_vine.png',
              fit: BoxFit.cover,
            ),
          ),
          _buildParcelsList(),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    /* Build */
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      title: Center(
        child: Text(
          AppLocalizations.of(context)!.appName,
          style: const TextStyle(fontWeight: FontWeight.w200),
        ),
      ),
      actions: <Widget>[
        if (!AuthenticationService().isOnlineState.value)
          Hero(
            tag: 'offline',
            flightShuttleBuilder: (flightContext, animation, flightDirection,
                fromHeroContext, toHeroContext) {
              return const Icon(
                Icons.cloud_off,
                color: Colors.white,
                size: 28.0,
              );
            },
            child: IconButton(
              icon: const Icon(
                Symbols.cloud_off,
                weight: 350,
                size: 28.0,
              ),
              onPressed: () {
                offlineDialog(context);
              },
            ),
          ),
        PopupMenuButton(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          icon: const Icon(Symbols.sort),
          onSelected: (selectedValue) {
            setState(() {
              _sortingOption = selectedValue;
            });
          },
          itemBuilder: (BuildContext context) {
            return [
              AppLocalizations.of(context)!.sortByNearest,
              AppLocalizations.of(context)!.sortByMostRecent,
              AppLocalizations.of(context)!.sortByOldest,
              AppLocalizations.of(context)!.sortAZ,
              AppLocalizations.of(context)!.sortZA,
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

  Center _buildParcelsList() {
    /* Sort parcels */
    List<Parcel> sortParcels(List<Parcel> parcels, List<Session> sessions) {
      if (_sortingOption == AppLocalizations.of(context)!.sortByNearest) {
        _checkLocation();
        parcels.sort((a, b) {
          if (a.latitude == null || a.longitude == null) {
            return 0;
          } else if (b.latitude == null || b.longitude == null) {
            return 0;
          } else if (_position == null) {
            return 0;
          }

          final aDistance = Geolocator.distanceBetween(
            _position!.latitude,
            _position!.longitude,
            a.latitude!,
            a.longitude!,
          );

          final bDistance = Geolocator.distanceBetween(
            _position!.latitude,
            _position!.longitude,
            b.latitude!,
            b.longitude!,
          );

          return aDistance.compareTo(bDistance);
        });
      } else if (_sortingOption == AppLocalizations.of(context)!.sortAZ) {
        parcels.sort(
            (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
      } else if (_sortingOption == AppLocalizations.of(context)!.sortZA) {
        parcels.sort(
            (a, b) => b.name.toLowerCase().compareTo(a.name.toLowerCase()));
      } else if (_sortingOption ==
          AppLocalizations.of(context)!.sortByMostRecent) {
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
              .map((session) => session.sessionDate.isNotEmpty
                  ? DateTime.parse(session.sessionDate)
                  : DateTime(0))
              .reduce((max, element) => max.isAfter(element) ? max : element);

          final bDate = bSessions
              .map((session) => session.sessionDate.isNotEmpty
                  ? DateTime.parse(session.sessionDate)
                  : DateTime(0))
              .reduce((max, element) => max.isAfter(element) ? max : element);

          return bDate.compareTo(aDate);
        });
      } else if (_sortingOption == AppLocalizations.of(context)!.sortByOldest) {
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
              .map((session) => session.sessionDate.isNotEmpty
                  ? DateTime.parse(session.sessionDate)
                  : DateTime(0))
              .reduce((min, element) => min.isBefore(element) ? min : element);
          final bDate = bSessions
              .map((session) => session.sessionDate.isNotEmpty
                  ? DateTime.parse(session.sessionDate)
                  : DateTime(0))
              .reduce((min, element) => min.isBefore(element) ? min : element);

          return aDate.compareTo(bDate);
        });
      }
      return parcels;
    }

    /* Build */
    return Center(
      child: FutureBuilder<List<dynamic>?>(
        future:
            Future.wait([IsarService().allParcels, IsarService().allSessions]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData) {
            return Text(AppLocalizations.of(context)!.infoNoParcels);
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
                if (a.sessionDate.isEmpty || b.sessionDate.isEmpty) {
                  return 0;
                }
                final aDate = DateTime.parse(a.sessionDate);
                final bDate = DateTime.parse(b.sessionDate);
                return bDate.compareTo(aDate);
              });
              if (currentSessionsParcel.isNotEmpty) {
                lastSession = AppLocalizations.of(context)!.infoLastSessionDate(
                  formatDate(
                    currentSessionsParcel.first.sessionDate,
                    explicit: true,
                  ),
                );
                icApex = calculateIcApex(
                  currentSessionsParcel.first.apexFullGrowth,
                  currentSessionsParcel.first.apexSlowerGrowth,
                  currentSessionsParcel.first.apexStuntedGrowth,
                );
              }

              bool isOnline = currentParcel.id != null;
              Color color = Theme.of(context).colorScheme.primary;
              String subtitle = lastSession;
              dynamic trailing = lastSession.isNotEmpty
                  ? LabelApexHydricConstraint(
                      text: calculateHydricConstraint(
                        currentSessionsParcel.first.apexFullGrowth,
                        currentSessionsParcel.first.apexSlowerGrowth,
                        currentSessionsParcel.first.apexStuntedGrowth,
                        icApex,
                        context,
                      ),
                    )
                  : null;

              if (isOnline == false) {
                color = Colors.grey.shade400;
                subtitle = AppLocalizations.of(context)!
                    .subtitleNoSaveParcelOfflineMode;
                trailing = Icon(
                  Symbols.cloud_off,
                  color: Colors.grey.shade400,
                  weight: 350,
                  size: 28.0,
                );
              }

              return Column(
                children: [
                  ListTile(
                    enabled: isOnline,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 30.0),
                    title: Text(
                      currentParcel.name,
                      style:
                          TextStyle(color: color, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      subtitle,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: color,
                          fontStyle: isOnline ? null : FontStyle.italic),
                    ),
                    trailing: trailing,
                    onTap: () async {
                      await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ParcelDetailPage(
                              parcel: currentParcel,
                              sessions: currentSessionsParcel,
                            );
                          },
                        ),
                      );
                      setState(() {
                        IsarService().allSessions;
                      });
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
      ),
    );
  }

  FloatingActionButton _buildFloatingActionButton(BuildContext context) {
    Future<void> addParcelDialog(BuildContext context) async {
      final TextEditingController parcelNameController =
          TextEditingController();
      final formKey = GlobalKey<FormState>();

      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(AppLocalizations.of(context)!.titleAddParcel),
            content: Form(
              key: formKey,
              child: TextFormField(
                controller: parcelNameController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.hintParcelName,
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!.validatorParcelName;
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
                child: Text(AppLocalizations.of(context)!.actionCancel),
              ),
              TextButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    parcelNameController.text =
                        toBeginningOfSentenceCase(parcelNameController.text)!;
                    final parcel = Parcel()..name = parcelNameController.text;
                    final bool isConnected =
                        await AuthenticationService().checkConnection(context);
                    if (isConnected) {
                      await ParcelsApiService().addParcel(parcel);
                    } else {
                      await IsarService().saveParcel(parcel);
                    }
                    setState(() {
                      IsarService().allParcels;
                    });
                    Navigator.of(context).pop();
                  }
                },
                child: Text(AppLocalizations.of(context)!.actionAdd),
              ),
            ],
          );
        },
      );
    }

    /* Build */
    return FloatingActionButton(
      onPressed: () {
        addParcelDialog(context);
      },
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Icon(Symbols.add, color: Theme.of(context).colorScheme.primary),
    );
  }
}
