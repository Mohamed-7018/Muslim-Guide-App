import 'package:flutter/material.dart';
import 'package:muslim_dialy_guide/app/core/utils/values.dart';



  IconButton themeIcon(theme, context) {
    return IconButton(
      icon: Icon(
        (theme.theme)
            ? GlobalAppIcons.darkModeIcon
            : GlobalAppIcons.lightModeIcon,
        color: Theme.of(context).colorScheme.secondary,
      ),
      onPressed: () {
        theme.switchTheme();
      },
    );
  }