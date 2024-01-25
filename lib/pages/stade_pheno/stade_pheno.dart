import 'package:apex_vigne/constants_language.dart';
import 'package:apex_vigne/pages/stade_pheno/widgets/tile_apex_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:apex_vigne/constants.dart';

class StadePheno extends StatefulWidget {
  const StadePheno({super.key});

  @override
  State<StadePheno> createState() => _StadePhenoState();
}

class _StadePhenoState extends State<StadePheno> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: stadesPheno.length,
                itemBuilder: (BuildContext context, int index) {
                  final stadePheno = stadesPheno[index];
                  return TileApexButton(
                    stadePheno: stadePheno,
                    onPressed: () {
                      Navigator.of(context).pop(index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      title: const Text(titleStadePheno),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop(-1);
        },
      ),
    );
  }
}
