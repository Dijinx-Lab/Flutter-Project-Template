// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

void main() async {
  final inputFile = File('assets/translations/translations.csv');
  final outputFolder = Directory('assets/translations');

  // Check if the input file exists
  if (!await inputFile.exists()) {
    print('Error: The file "translations.csv" does not exist.');
    return;
  }

  // Ensure output directory exists
  if (!await outputFolder.exists()) {
    await outputFolder.create();
  }

  // Read CSV file and split by lines
  final lines = await inputFile.readAsLines();
  if (lines.isEmpty) {
    print('CSV file is empty');
    return;
  }

  // Parse the header line to get the column names
  final headers = lines.first.split(',');
  print('Headers: $headers');

  // Loop through each column (skip the first column, which is "KEYS")
  for (var i = 1; i < headers.length; i++) {
    final columnName = headers[i].trim();
    final lowercaseColumnName = columnName.toLowerCase();
    print('Processing column: $columnName');

    // Create a JSON map for the current column
    final jsonMap = <String, String>{};

    // Loop through each line in the CSV file, starting from the second line
    for (var j = 1; j < lines.length; j++) {
      final values = lines[j].split(',');

      // Ensure we have enough columns in this row
      if (values.length <= i) {
        print('Skipping line ${j + 1} due to insufficient columns');
        continue;
      }

      // Extract the key and value
      final key = values[0].trim();
      final value = values[i].trim();

      if (key.isNotEmpty && value.isNotEmpty) {
        jsonMap[key] = value;
        print('Adding entry: "$key": "$value"');
      }
    }

    // Write formatted JSON map to file
    final jsonFile = File('${outputFolder.path}/$lowercaseColumnName.json');
    const encoder = JsonEncoder.withIndent(
        '  '); // Use two-space indentation for readability
    await jsonFile.writeAsString(encoder.convert(jsonMap),
        mode: FileMode.writeOnly);
    print('File created: ${jsonFile.path}');
  }

  print(
      'Formatted JSON files have been created in the "${outputFolder.path}" folder.');
}
