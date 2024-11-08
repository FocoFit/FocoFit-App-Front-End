import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:focofit/utils/local_storage.dart';
import 'package:get/get.dart';

class Languages extends Translations {
  static Map<String, Map<String, String>> translations = {};
  static String? languageCode;
  static String? countryCode;

  static Future<void> loadTranslations() async {
    String englishJson =
        await rootBundle.loadString('assets/languages/en_US.json');
    String portugueseJson =
        await rootBundle.loadString('assets/languages/pt_PT.json');

    translations['en_US'] = Map<String, String>.from(json.decode(englishJson));
    translations['pt_PT'] =
        Map<String, String>.from(json.decode(portugueseJson));

    languageCode = MyLocalStorage.read(MyLocalStorage.languageCode) ?? 'pt';
    countryCode =
        MyLocalStorage.read(MyLocalStorage.languageCountryCode) ?? 'PT';

    // languageCode = MyLocalStorage.read(MyLocalStorage.languageCode) ?? 'en';
    // countryCode =
    //     MyLocalStorage.read(MyLocalStorage.languageCountryCode) ?? 'US';
  }

  @override
  Map<String, Map<String, String>> get keys => translations;
}
