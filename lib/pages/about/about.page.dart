import 'package:flutter/material.dart';
import 'package:apex_vigne/constants.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /* First section */
            Text(
              'Application ApeX Vigne',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(letterSpacing: 1.2),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Color(0xFFF5F5F5),
              ),
              child: Text(
                aboutDescription,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(letterSpacing: 1.2, color: Colors.grey[700]),
              ),
            ),
            const SizedBox(height: 20),
            /* Second section */
            Text(
              'Partenaires',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(letterSpacing: 1.2),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Color(0xFFF5F5F5),
              ),
              child: const Wrap(
                alignment: WrapAlignment.spaceEvenly,
                runSpacing: 20,
                children: [
                  Image(
                      image: AssetImage('assets/images/logos/logo_ifv.png'),
                      width: 145),
                  SizedBox(width: 20),
                  Image(
                      image: AssetImage('assets/images/logos/logo_agrotic.png'),
                      width: 145),
                  SizedBox(width: 20),
                  Image(
                      image: AssetImage('assets/images/logos/logo_iam.png'),
                      height: 50),
                  SizedBox(width: 20),
                  Image(
                      image:
                          AssetImage('assets/images/logos/logo_occitanie.png'),
                      width: 145),
                  SizedBox(width: 20),
                  Image(
                      image: AssetImage(
                          'assets/images/logos/logo_agricultures_territoires.png'),
                      width: 145),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    /* Build */
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      title: const Text('À propos'),
    );
  }
}
