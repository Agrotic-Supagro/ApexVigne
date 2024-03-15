import 'package:flutter/material.dart';

class IcApexCell extends StatelessWidget {
  const IcApexCell({
    super.key,
    required this.icApex,
  });

  final double icApex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade200,
      ),
      child: Text(
        icApex == 0 ? 'N/A' : icApex.toStringAsFixed(2),
        style: TextStyle(
          color: Colors.grey.shade600,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
