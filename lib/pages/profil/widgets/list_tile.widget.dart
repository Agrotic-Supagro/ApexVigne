import 'package:flutter/material.dart';

class ListTileInfo extends StatelessWidget {
  const ListTileInfo({
    super.key,
    required this.text,
    this.info = 'N/A',
  });

  final String text;
  final String? info;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text, style: Theme.of(context).textTheme.labelMedium!.copyWith(letterSpacing: 1.2, fontWeight: FontWeight.w400)),
      trailing: Text(info ?? 'N/A', style: Theme.of(context).textTheme.labelMedium!.copyWith(letterSpacing: 1.2)),
    );
  }
}
