import 'dart:ui';

import 'package:apex_vigne/collections/parcel.collection.dart';
import 'package:apex_vigne/collections/session.collection.dart';
import 'package:apex_vigne/pages/create_and_update_session/create_and_update_session.page.dart';
import 'package:apex_vigne/pages/parcel_detail/widgets/ic_apex_cell.widget.dart';
import 'package:apex_vigne/services/auth.service.dart';
import 'package:apex_vigne/services/calculations.service.dart';
import 'package:apex_vigne/services/isar.service.dart';
import 'package:apex_vigne/services/sessions_api.service.dart';
import 'package:apex_vigne/shared_widgets/elevated_apex_button.widget.dart';
import 'package:apex_vigne/pages/parcel_detail/widgets/ic_apex_line_chart.widget.dart';
import 'package:apex_vigne/shared_widgets/label_apex_hydric_constraint.dart';
import 'package:apex_vigne/shared_widgets/offline_dialog.dart';
import 'package:apex_vigne/utils/determine_position.dart';
import 'package:apex_vigne/utils/format_date.dart';
import 'package:apex_vigne/utils/is_pruned.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class ParcelDetailPage extends StatefulWidget {
  final Parcel parcel;
  final List<Session>? sessions;

  const ParcelDetailPage({
    super.key,
    required this.parcel,
    required this.sessions,
  });

  @override
  State<ParcelDetailPage> createState() => _ParcelDetailPageState();
}

class _ParcelDetailPageState extends State<ParcelDetailPage> {
  late TutorialCoachMark tutorialCoachMark;
  late SharedPreferences prefs;
  GlobalKey keyTable = GlobalKey();

  @override
  void initState() {
    initialTutorial();
    super.initState();
  }

  void initialTutorial() async {
    if (!context.mounted) return;

    prefs = await SharedPreferences.getInstance();
    bool tutorialLongPressEditSession = prefs.getBool('tutorialLongPressEditSession') ?? true;
    if ((widget.sessions?.isNotEmpty ?? false) && tutorialLongPressEditSession) {
      createTutorial();
      Future.delayed(Duration.zero, showTutorial);
      prefs.setBool('tutorialLongPressEditSession', false);
    }
  }

  void createTutorial() {
    tutorialCoachMark = TutorialCoachMark(
      targets: [
        TargetFocus(
          identify: "Table",
          keyTarget: keyTable,
          contents: [
            TargetContent(
              align: ContentAlign.top,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.titleTutoEditSession,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    AppLocalizations.of(context)!.infoTutoEditSession,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            )
          ],
          shape: ShapeLightFocus.RRect,
          radius: 5,
          color: Colors.black,
        ),
      ],
      textSkip: AppLocalizations.of(context)!.actionUnderstand,
      alignSkip: Alignment.topRight,
      colorShadow: Colors.black,
      paddingFocus: 10,
      opacityShadow: 0.5,
      imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      onSkip: () {
        return true;
      },
    );
  }

  void showTutorial() {
    tutorialCoachMark.show(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              if (widget.sessions?.isNotEmpty ?? false)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  child: Text(
                    AppLocalizations.of(context)!
                        .infoNbSessions(widget.sessions!.length),
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.8),
                        ),
                  ),
                ),
              const SizedBox(height: 20),
              if (widget.sessions?.isNotEmpty ?? false)
                IcApexLineChart(
                  sessions: widget.sessions!.reversed.where((element) => !isPruned(element)).toList(),
                ),
              const SizedBox(height: 20),
              if (widget.sessions?.isNotEmpty ?? false)
                _buildSessionsBoard(context),
              if (widget.sessions?.isEmpty ?? false)
                Text(
                  AppLocalizations.of(context)!.infoNoSessionInParcel,
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
      actions: [
        if (!AuthenticationService().isOnlineState.value)
          Hero(
            tag: 'offline',
            flightShuttleBuilder: (
              flightContext,
              animation,
              flightDirection,
              fromHeroContext,
              toHeroContext,
            ) {
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
      ],
    );
  }

  Theme _buildSessionsBoard(BuildContext context) {
    Future<dynamic> notesDialog(BuildContext context, String notes) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(AppLocalizations.of(context)!.titleNotes),
            content: Text(notes),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(AppLocalizations.of(context)!.actionClose),
              ),
            ],
          );
        },
      );
    }

    void updateSession(BuildContext context, Session session) async {
      final bool isConnected = await AuthenticationService().checkConnection(context);

      if (!context.mounted) {
        return;
      }

      if (!isConnected) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Symbols.cloud_off, color: Colors.white),
                const SizedBox(width: 20),
                Expanded(
                  child: Text(AppLocalizations.of(context)!.infoHaveToRequired),
                ),
              ],
            ),
            backgroundColor: const Color(0xFFCCB152),
          ),
        );
        return;
      }
      final Session? sessionUpdated = await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return CreateUpdateSession(
              title: AppLocalizations.of(context)!.titleEditSession,
              parcelId: widget.parcel.id!,
              session: session,
            );
          },
        ),
      );

      if (sessionUpdated != null) {
        setState(() {
          widget.sessions!.remove(session);
          widget.sessions!.add(sessionUpdated);
          widget.sessions!.sort((a, b) => DateTime.parse(b.sessionDate)
              .compareTo(DateTime.parse(a.sessionDate)));
        });
      }
    }

    /* Build */
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: SizedBox(
        width: double.infinity,
        child: DataTable(
          key: keyTable,
          columns: [
            DataColumn(label: Expanded(child: Text(AppLocalizations.of(context)!.infoDate, textAlign: TextAlign.left))),
            DataColumn(
              label: Expanded(child: Text(AppLocalizations.of(context)!.infoIcApex, textAlign: TextAlign.left)),
              tooltip: AppLocalizations.of(context)!.tooltipIcApex,
            ),
            DataColumn(
              label: Expanded(child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(AppLocalizations.of(context)!.tooltipHydricConstraint, textAlign: TextAlign.left, overflow: TextOverflow.fade),
              )),
              tooltip: AppLocalizations.of(context)!.tooltipHydricConstraint,
            ),
            DataColumn(label: Expanded(child: Text(AppLocalizations.of(context)!.titleNotes, textAlign: TextAlign.left))),
          ],
          dividerThickness: 0.0,
          columnSpacing: 5.0,
          dataRowMinHeight: 50.0,
          dataRowMaxHeight: 60.0,
          rows: widget.sessions?.map<DataRow>((session) {
                final double icApex = calculateIcApex(session);
                return DataRow(
                  onLongPress: () => updateSession(context, session),
                  cells: [
                    DataCell(
                      Text(formatDate(session.sessionDate, explicit: true), overflow: TextOverflow.ellipsis),
                    ),
                    DataCell(IcApexCell(icApex: icApex, isPruned: isPruned(session))),
                    DataCell(
                      LabelApexHydricConstraint(
                        text: calculateHydricConstraint(session, icApex, context),
                      ),
                    ),
                    DataCell(
                      Visibility(
                        visible: session.notes != null && session.notes!.isNotEmpty,
                        child: ElevatedApexButton(
                          icon: Icons.article_outlined,
                          callback:
                              session.notes == null || session.notes!.isEmpty
                                  ? null
                                  : () => notesDialog(context, session.notes!),
                        ),
                      ),
                    ),
                  ],
                );
              }).toList() ??
              [],
        ),
      ),
    );
  }

  Row _buildFloatingActionButton(BuildContext context) {
    Future<dynamic> prunedParcelDialog(BuildContext context) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(AppLocalizations.of(context)!.titlePrunedParcel),
            content:
                Text(AppLocalizations.of(context)!.infoConfirmPrunedParcel),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(AppLocalizations.of(context)!.actionCancel),
              ),
              TextButton(
                onPressed: () async {
                  final session = Session()
                    ..sessionDate =
                        DateFormat('yyyy-MM-dd').format(DateTime.now())
                    ..apexFullGrowth = 0
                    ..apexSlowerGrowth = 0
                    ..apexStuntedGrowth = 0
                    ..parcelId = widget.parcel.id!
                    ..inField = 0
                    ..latitude = null
                    ..longitude = null;
                  final bool isConnected =
                      await AuthenticationService().checkConnection(context);
                  if (isConnected) {
                    await SessionsApiService().addSession(session);
                  } else {
                    await IsarService().saveSession(session);
                  }
                  setState(() {
                    widget.sessions!.add(session);
                    widget.sessions!.sort((a, b) =>
                        DateTime.parse(b.sessionDate)
                            .compareTo(DateTime.parse(a.sessionDate)));
                  });
                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                },
                child: Text(AppLocalizations.of(context)!.actionConfirm),
              ),
            ],
          );
        },
      );
    }

    Future<bool> checkLocation() async {
      bool isSuccess = true;

      await checkLocationPermission(context).catchError((error) {
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
        isSuccess = false;
      });
      return isSuccess;
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
          text: AppLocalizations.of(context)!.actionNewSession,
          mainButton: true,
          callback: () async {
            if (!await checkLocation()) {
              return;
            }
            final Session? session = await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return CreateUpdateSession(
                    title: AppLocalizations.of(context)!.titleNewSession,
                    parcelId: widget.parcel.id!,
                  );
                },
              ),
            );
            if (session != null) {
              setState(() {
                widget.sessions!.add(session);
                widget.sessions!.sort((a, b) => DateTime.parse(b.sessionDate)
                    .compareTo(DateTime.parse(a.sessionDate)));
                initialTutorial();
              });
            }
          },
        ),
        const SizedBox(width: 60),
      ],
    );
  }
}
