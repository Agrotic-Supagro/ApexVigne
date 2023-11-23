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
  String _formatDate(String timestamp) {
    final date = DateTime.parse(timestamp);
    final formattedDate = DateFormat.MMMMd('fr').format(date);
    return formattedDate;
  }

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
      body: ListView.builder(
        itemCount: widget.sessions?.length ?? 0,
        itemBuilder: (context, index) {
          final session = widget.sessions![index];
          return ListTile(
            title: Text(_formatDate(session.sessionDate)),
            // Add more details about the session here
          );
        },
      ),
      floatingActionButton: Row(
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
                }
            ),
        ],
      ),
    );
  }
}
