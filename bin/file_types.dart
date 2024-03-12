import 'dart:convert';
import 'dart:io';
import 'dart:math';

Future<void> main() async {
  var input = 'data.txt';
  var output = 'test.json';
  List row = await File(input).readAsLines();
  var file = File(output);
  await file.writeAsString("[");
  for (int i = 0; i < row.length; i++) {
    String jsonString = jsonEncode({
      "id": i + 1,
      "username": row[i],
      "password": generatePassword(16),
    });
    if (i + 1 != row.length) {
      await writeAsString(file: file, contents: "$jsonString,");
    } else {
      await writeAsString(file: file, contents: "$jsonString]");
    }
  }
}

Future<void> writeAsString(
    {required File file, required String contents}) async {
  await file.writeAsString(contents, mode: FileMode.append);
}

String generatePassword(int length) {
  const String allCharacters =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#%&*()-_=+[{]}<>?';
  Random random = Random();
  List<String> result = List.generate(length, (index) {
    return allCharacters[random.nextInt(allCharacters.length)];
  });
  return result.join('');
}
