


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkTheme = false ;
  SharedPreferences preferences;

  bool get theme => isDarkTheme;

/*---------------------------------------------------------------------------------------------*/
/*-------------------------------- loading shared preferences  --------------------------------*/
/*---------------------------------------------------------------------------------------------*/
  initPrefs() async {
    if (preferences == null) {
      preferences = await SharedPreferences.getInstance();
    }
  }
/*---------------------------------------------------------------------------------------------*/
/*-------------------------------------- getting theme  --------------------------------------*/
/*---------------------------------------------------------------------------------------------*/
  _loadPrefs() async {
    await initPrefs();
    isDarkTheme = preferences.getBool('theme') ?? false;
    notifyListeners();
  }

  ThemeProvider() {
    _loadPrefs();
  }

/*---------------------------------------------------------------------------------------------*/
/*-------------------------------------- Switching theme  --------------------------------------*/
/*---------------------------------------------------------------------------------------------*/
  switchTheme() {
    isDarkTheme = !isDarkTheme;
    _savePrefs();
    notifyListeners();
  }

/*---------------------------------------------------------------------------------------------*/
/*--------------------------------- save theme after switching  ---------------------------------*/
/*---------------------------------------------------------------------------------------------*/
  _savePrefs() async {
    await initPrefs();
    preferences.setBool('theme', isDarkTheme);
  }
}