import 'package:atlas_mrowek/src/ant_card.dart';
import 'package:atlas_mrowek/src/models/species.dart';
import 'package:flutter/cupertino.dart';

class AtlasHomePage extends StatefulWidget {
  final List<Species> antList;

  const AtlasHomePage({super.key, required this.antList});

  @override
  State<AtlasHomePage> createState() => _AtlasHomePageState();
}

class _AtlasHomePageState extends State<AtlasHomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Atlas mrówek'),
      ),
      child: GridView.count(
        padding: const EdgeInsets.all(12),
        crossAxisCount: 2,
        children: widget.antList.map((species) {
          String imageUrl = species.imgPath;
          print(imageUrl);

          return AntCard(
            imageUrl: imageUrl,
            caption: species.name ?? 'Unknown Ant',
            description: species.description ?? 'No description available.',
          );
        }).toList(),
      ),
    );
  }
}
