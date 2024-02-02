import 'package:flutter/material.dart';

class ElevatedApexButton extends StatelessWidget {
  const ElevatedApexButton(
      {super.key, this.icon, this.text, this.callback, this.mainButton = false});

  final IconData? icon;
  final String? text;
  final VoidCallback? callback;
  final bool mainButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        backgroundColor: mainButton ? Theme.of(context).colorScheme.primary : null,
        foregroundColor: mainButton ? Theme.of(context).colorScheme.onPrimary : null
      ),
      child: Builder(
        builder: (context) {
          if (icon != null) {
            return Icon(icon);
          } else if (text != null) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(text!),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
