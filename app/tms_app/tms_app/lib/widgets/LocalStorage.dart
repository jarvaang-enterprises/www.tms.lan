import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:tms_app/widgets/datastore.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorage implements DataStore {
  Future<File> _localFile(String filename) async {
    final path = await _localPath;
    return File('$path/$filename');
  }

  Future<String> get _localPath async {
    final directory = await getApplicationSupportDirectory();

    return directory.path;
  }

  Future<String> getFilename(String userId, String type, String key) async {
    return userId + '/' + type + '/' + key;
  }

  @override
  Future<Uint8List> getImage(String userId, String key) async {
    final filename = await getFilename(userId, 'images', key);
    final file = await _localFile(filename);

    if (await file.exists()) return await file.readAsBytes();
    return null;
  }

  @override
  Future<String> getString(String userId, String key) async {
    final filename = await getFilename(userId, 'strings', key);
    final file = await _localFile(filename);

    if (await file.exists()) return await file.readAsString();
    return null;
  }

  @override
  Future<Map<String, dynamic>> getObject(String userId, String key) async {
    final filename = await getFilename(userId, 'objects', key);
    final file = await _localFile(filename);

    if (await file.exists()) {
      final objectString = await file.readAsString();
      return JsonDecoder().convert(objectString);
    }

    return null;
  }

  @override
  Future<String> saveImage(String userId, String key, Uint8List image) async {
    final filename = await getFilename(userId, 'images', key);
    final file = await _localFile(filename);
    print(file);

    if (!await file.parent.exists()) await file.parent.create(recursive: true);

    await file.writeAsBytes(image);

    return filename;
  }

  @override
  void saveObject(
      String userId, String key, Map<String, dynamic> object) async {
    final filename = await getFilename(userId, 'objects', key);
    final file = await _localFile(filename);

    if (!await file.parent.exists()) await file.parent.create(recursive: true);

    final jsonString = JsonEncoder().convert(object);
    await file.writeAsString(jsonString);
  }

  @override
  void saveString(String userId, String key, String value) async {
    final filename = await getFilename(userId, 'strings', key);
    final file = await _localFile(filename);

    if (!await file.parent.exists()) await file.parent.create(recursive: true);

    await file.writeAsString(value);
  }

  @override
  Future<void> removeImage(String userId, String key) async {
    final filename = await getFilename(userId, 'images', key);
    final file = await _localFile(filename);
    if (await file.exists()) await file.delete();
  }

  @override
  Future<void> removeObject(String userId, String key) async {
    final filename = await getFilename(userId, 'objects', key);
    final file = await _localFile(filename);
    if (await file.exists()) await file.delete();
  }

  @override
  Future<void> removeString(String userId, String key) async {
    final filename = await getFilename(userId, 'strings', key);
    final file = await _localFile(filename);
    if (await file.exists()) await file.delete();
  }
}
