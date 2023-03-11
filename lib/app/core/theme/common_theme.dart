import 'package:flutter/material.dart';
import 'package:muslim_dialy_guide/app/core/utils/values.dart';

/*------------------------------------------------------------------------------------------*/
/*------------------------------------  Common Theme  ---------------------------------------*/
/*------------------------------------------------------------------------------------------*/

var commonTheme = ThemeData(
  primaryColor: GlobalAppColors.appBlue,
  dividerColor: GlobalAppColors.appPink,
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: GlobalAppColors.appPink),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
