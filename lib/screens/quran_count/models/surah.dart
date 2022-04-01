import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

class Surah {
  int ayahCount;
  String name;
  int index;
  Map<String, dynamic> verses;
  String surahPath;

  Surah(this.surahPath);

  Future<void> initSurah() async {
    String surah = await rootBundle.loadString(surahPath);
    var decodedSurah = jsonDecode(surah);
    ayahCount = decodedSurah['count'] as int;
    verses = decodedSurah['verse'] as Map<String, dynamic>;
    index = int.parse(decodedSurah['index']);
    name = decodedSurah['name'] as String;
  }
}
