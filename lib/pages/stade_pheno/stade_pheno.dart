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
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Stade pheno page'),
              ]),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      title: const Text('Stades phénologiques'),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
