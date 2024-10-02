import 'package:atlas_mrowek/src/homepage.dart';
import 'package:atlas_mrowek/src/models/load_ants.dart';
import 'package:atlas_mrowek/src/models/species.dart';
import 'package:flutter/cupertino.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: FutureBuilder<List<Species>>(
        future: loadAnts(), // Asynchronously load ants
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While waiting for the data, show a loading spinner
            return const CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text('Loading...'),
              ),
              child: Center(child: CupertinoActivityIndicator()),
            );
          } else if (snapshot.hasError) {
            // If an error occurs, show an error message
            return const CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text('Error'),
              ),
              child: Center(child: Text('Failed to load data')),
            );
          } else if (snapshot.hasData) {
            // If data is available, render the homepage
            return AtlasHomePage(antList: snapshot.data!);
          } else {
            // If there's no data for some reason
            return const CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text('No Data'),
              ),
              child: Center(child: Text('No ants found')),
            );
          }
        },
      ),
    );
  }
}
