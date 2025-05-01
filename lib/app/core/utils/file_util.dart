import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileUtil {
  static Future<File> getLocalFile(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$fileName');
  }

  static Future<void> writeFile(String fileName, String content) async {
    final file = await getLocalFile(fileName);
    await file.writeAsString(content);
  }

  static Future<String> readFile(String fileName) async {
    try {
      final file = await getLocalFile(fileName);
      return await file.readAsString();
    } catch (e) {
      return 'Error reading file';
    }
  }
}
