import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppFlutterSecureStorage {
  static final Storage =  FlutterSecureStorage();

 static Future<void> saveSecureData(String key, String? value) async {
    await Storage.write(key: key, value: value);
  }

  static Future<String?> getSecureData(String key) async {
    return await Storage.read(key: key);
  }
  static Future<void> deleteSecureData(String key) async {
    await Storage.delete(key: key);
  }

}