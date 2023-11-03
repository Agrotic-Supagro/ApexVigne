import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class TileApexButton extends StatelessWidget {
  const TileApexButton({
    super.key,
    required this.stadePheno,
    this.onPressed,
  });

  final Map<String, dynamic> stadePheno;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)))),
            onPressed: () {
              Vibration.vibrate(duration: 10);
              onPressed;
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child: Image.asset(
                    stadePheno['imgPath'],
                    fit: BoxFit.cover,
                    height: double.infinity,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Text(stadePheno['name'],
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.bold)),
                        Text(stadePheno['stade'],
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith()),
                        Text(stadePheno['description'],
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith()),
                      ],
                    )),
              ],
            )),
      ),
    );
  }
}
