import 'package:flutter/material.dart';
import 'package:muslim_dialy_guide/app/core/utils/values.dart';

import 'common_theme.dart';

/*------------------------------------------------------------------------------------------*/
/*------------------------------------  Light Theme  ---------------------------------------*/
/*------------------------------------------------------------------------------------------*/

ThemeData lightTheme = ThemeData.light().copyWith(
  useMaterial3: true,
  primaryColor: commonTheme.primaryColor,
  colorScheme: ColorScheme.fromSwatch()
      .copyWith(secondary: commonTheme.colorScheme.secondary),
  scaffoldBackgroundColor: GlobalAppColors.kScaffoldLight,
  dividerColor: commonTheme.dividerColor,
  visualDensity: commonTheme.visualDensity,
);
