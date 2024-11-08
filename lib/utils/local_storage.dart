import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class MyLocalStorage {
  static final GetStorage _storage = GetStorage();
  static const String languageName = 'languageName';
  static const String languageCode = 'languageCode';
  static const String languageCountryCode = 'languageCountryCode';
  static const String userId = 'userId';

  static void write(String key, dynamic value) {
    _storage.write(key, value);
    debugPrint('Write to key: $key value: $value');
  }

  static dynamic read(String key) {
    dynamic value = _storage.read(key);
    debugPrint('Read from key: $key value: $value');
    return value;
  }

  static void remove(String key) {
    _storage.remove(key);
  }

  static void eraseAllLocalStorage() {
    _storage.erase();
    debugPrint('Storage erased while debugPrintout');
  }
}
