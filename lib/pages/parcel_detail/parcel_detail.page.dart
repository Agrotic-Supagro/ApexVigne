import 'package:apex_vigne/models/parcel.model.dart';
import 'package:apex_vigne/models/session.model.dart';
import 'package:apex_vigne/pages/new_session/new_session.page.dart';
import 'package:apex_vigne/widgets/elevated_apex_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';

class ParcelDetailPage extends StatefulWidget {
  final Parcel parcel;
  final List<Session>? sessions;

  const ParcelDetailPage(
      {super.key, required this.parcel, required this.sessions});

  @override
  _ParcelDetailPageState createState() => _ParcelDetailPageState();
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
              callback: () => {})
        ],
      ),
    );
  }
}
