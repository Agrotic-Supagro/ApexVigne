import 'package:intl/intl.dart';

String formatDate(String? timestamp, {bool explicit = false}) {
  if (timestamp == null || timestamp.isEmpty) {
    return '';
  }
  final date = DateTime.parse(timestamp);
  if (explicit) {
    return DateFormat.yMMMM('fr').format(date);
  }

  return DateFormat.Md('fr').format(date);
}
