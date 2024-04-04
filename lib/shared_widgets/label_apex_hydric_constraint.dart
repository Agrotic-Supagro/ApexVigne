import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LabelApexHydricConstraint extends StatefulWidget {
  const LabelApexHydricConstraint({
    super.key,
    required this.text,
    this.icApex
  });

  final String text;
  final String? icApex;

  @override
  State<LabelApexHydricConstraint> createState() =>
      _LabelApexHydricConstraintState();
}

class _LabelApexHydricConstraintState extends State<LabelApexHydricConstraint> {
  Color bgColor = Colors.grey.shade500;
  Color textColor = Colors.grey.shade300;

  void determineHydricConstraintStyle(BuildContext context) {
    if (widget.text == AppLocalizations.of(context)!.infoPruned) {
      textColor = const Color(0xFF707070);
      bgColor = const Color(0xFFE8E8E8);
    } else if (widget.text == AppLocalizations.of(context)!.infoIFV3) {
      textColor = const Color(0xFFCC5E52);
      bgColor = const Color(0xFFFAEAE8);
    } else if (widget.text == AppLocalizations.of(context)!.infoIFV2) {
      textColor = const Color(0xFFCCB152);
      bgColor = const Color(0xFFFAF6E8);
    } else if (widget.text == AppLocalizations.of(context)!.infoIFV1) {
      textColor = const Color(0xFFCCC852);
      bgColor = const Color(0xFFFAF9E8);
    } else if (widget.text == AppLocalizations.of(context)!.infoIFV0) {
      textColor = const Color(0xFFA7CC52);
      bgColor = const Color(0xFFF5FAE8);
    }
  }

  @override
  Widget build(BuildContext context) {
    determineHydricConstraintStyle(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: bgColor,
      ),
      child: Text(widget.icApex ?? widget.text, style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
    );
  }
}
