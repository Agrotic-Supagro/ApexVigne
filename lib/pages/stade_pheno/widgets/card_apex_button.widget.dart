import 'package:flutter/material.dart';

class CardApexButton extends StatelessWidget {
  const CardApexButton({
    super.key,
    required this.imgPath,
    required this.text,
    this.onPressed,
    this.onLongPressed,
    required this.count,
  });

  final String imgPath;
  final String text;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;
  final int count;

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
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child: Image.asset(
                    imgPath,
                    fit: BoxFit.cover,
                    height: double.infinity,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                    flex: 3,
                    child: Text(text,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontWeight: FontWeight.bold))),
                Expanded(
                  flex: 0,
                  child: TextButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    onLongPress: () {},
                    onPressed: onPressed,
                    child: ClipOval(
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Theme.of(context).colorScheme.primary,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              count.toString(),
                              style: const TextStyle(
                                color: Colors.white, // Couleur du texte
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
