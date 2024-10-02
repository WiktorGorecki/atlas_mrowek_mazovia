import 'package:flutter/services.dart' show rootBundle;
import 'package:yaml/yaml.dart';
import 'species.dart'; // Make sure this imports your Species class

Future<List<Species>> loadAnts() async {
  List<Species> speciesList = [];

  // Define the list of yaml files
  List<String> yamlFiles = [
    'assets/data/c-fallax.yml',
    'assets/data/f-fusca.yml',
    'assets/data/l-niger.yml',
    'assets/data/l-flavus.yml',
    'assets/data/s-fugax.yml',
    'assets/data/s-debile.yml',
    'assets/data/m-rubida.yml'
    // Add other YAML file paths here
  ];

  // Loop through each YAML file
  for (String yamlFilePath in yamlFiles) {
    // Load the YAML file content
    String yamlContent = await rootBundle.loadString(yamlFilePath);

    // Parse YAML content
    var yamlData = loadYaml(yamlContent);

    // Extract fields from YAML
    String name = yamlData['name'];
    String description = yamlData['description'];
    String imgPath = yamlData['imgPath'];
    print("Parsed imgPath: $imgPath");

    // Full path to the image
    String imagePath = 'assets/img/$imgPath';
    print("Constructed imagePath: $imagePath");

    // Create a Species object
    Species species = Species(name, description,
        imagePath // Pass the image path to the Species constructor
        );

    // Add species to the list
    speciesList.add(species);
  }

  return speciesList;
}
