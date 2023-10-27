import 'package:flutter/material.dart';

class ElevatedApexButton extends StatelessWidget {
  const ElevatedApexButton(
      {super.key, this.icon, this.text, required this.callback});

  final IconData? icon;
  final String? text;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      child: Builder(
        builder: (context) {
          if (icon != null) {
            return Icon(icon);
          } else if (text != null) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
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
