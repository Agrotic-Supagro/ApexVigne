import 'package:apex_vigne/models/parcel.model.dart';
import 'package:flutter/material.dart';
import 'package:apex_vigne/pages/profil/profil.page.dart';
import 'package:apex_vigne/services/server_api.service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ServerApiService _apiService = ServerApiService();

  Future<List<Parcel>?> fetchParcelData() async {
    try {
      return await _apiService.retrieveUserData("parcelle");
    } catch (e) {
      debugPrint('Error fetching parcel data: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerApexVigne(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Apex Vigne'),
      ),
      body: Center(
        child: FutureBuilder<List<Parcel>?>(
          future: fetchParcelData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData) {
              return const Text('No parcel data available');
            }

            final parcel = snapshot.data!;

            return ListView.builder(
              itemCount: parcel.length,
              itemBuilder: (context, index) {
                final currentParcel = parcel[index];
                return ListTile(
                  title: Text(currentParcel.name),
                  subtitle: const Text('Dernière observation le'),
                );
              },
            );
          },
        )
      ),
    );
  }
}

class DrawerApexVigne extends StatelessWidget {
  const DrawerApexVigne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            child: const Text('Menu'),
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const ProfilPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
