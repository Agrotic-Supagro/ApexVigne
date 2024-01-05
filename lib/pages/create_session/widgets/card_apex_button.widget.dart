import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class CardApexButton extends StatefulWidget {
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
  State<CardApexButton> createState() => _CardApexButtonState();
}

class _CardApexButtonState extends State<CardApexButton> {
  late TutorialCoachMark tutorialCoachMark;
  late SharedPreferences prefs;
  GlobalKey keyButton = GlobalKey();

  @override
  void initState() {
    super.initState();
    initialTutorial();
  }

  void initialTutorial() async {
    prefs = await SharedPreferences.getInstance();
    bool isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;
    if (widget.text == "Pleine croissance" && true) {
      createTutorial();
      Future.delayed(Duration.zero, showTutorial);
      prefs.setBool('isFirstLaunch', false);
    }
  }

  void createTutorial() {
    tutorialCoachMark = TutorialCoachMark(
      targets: [
        TargetFocus(
          identify: "Counter",
          keyTarget: keyButton,
          contents: [
            TargetContent(
              align: ContentAlign.bottom,
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Changer le nombre à tout moment !!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Vous pouvez éditer le nombre d'observations en maintenant le compteur",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Icon(Symbols.warning, color: Color(0xFFCCB152)),
                      SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          "Attention, si vous changez le nombre d'observations, vous perdrez la position des observations",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
          shape: ShapeLightFocus.RRect,
          radius: 5,
          color: Colors.black,
        ),
      ],
      textSkip: "J'ai compris !",
      colorShadow: Colors.black,
      paddingFocus: 10,
      opacityShadow: 0.5,
      imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      onSkip: () {
        return true;
      },
    );
  }

  void showTutorial() {
    tutorialCoachMark.show(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
          ),
          onPressed: widget.onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: Image.asset(
                  widget.imgPath,
                  fit: BoxFit.cover,
                  height: double.infinity,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 5,
                child: Text(
                  widget.text,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                key: keyButton,
                flex: 0,
                child: TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                  onLongPress: widget.onLongPressed,
                  onPressed: widget.onPressed,
                  child: ClipOval(
                    child: Container(
                      width: 60,
                      height: 60,
                      color: Theme.of(context).colorScheme.primary,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            widget.count.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
