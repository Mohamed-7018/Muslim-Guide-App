import 'package:flutter/material.dart';
import 'package:muslim_dialy_guide/app/core/utils/values.dart';

/*------------------------------------------------------------------------------------------*/
/*------------------------------------  Common Theme  ---------------------------------------*/
/*------------------------------------------------------------------------------------------*/

var commonTheme = ThemeData(
  primaryColor: GlobalAppColors.appGray,
  dividerColor: GlobalAppColors.appBlue,
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: GlobalAppColors.appBlue),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
