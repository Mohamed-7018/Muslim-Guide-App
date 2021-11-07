import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim_dialy_guide/provides/theme_provider.dart';
import 'package:provider/provider.dart';

class GlobalAppBar extends PreferredSize {
  final String title;

  const GlobalAppBar({
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    return AppBar(
      title: Text(
        title,
        style: GoogleFonts.lilyScriptOne(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.w300,
        ),
      ),
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      actions: [
        _themeIcon(theme, context),
      ],
      leading:  CupertinoNavigationBarBackButton(
              color: Theme.of(context).accentColor,
            ),
    );
  }

  _themeIcon(theme, context) {
    return IconButton(
      icon: Icon(
        (theme.theme)
            ? Icons.brightness_7_outlined
            : Icons.brightness_4_outlined,
        color: Theme.of(context).accentColor,
      ),
      onPressed: () {
        theme.switchTheme();
      },
    );
  }

  @override
  Size get preferredSize {
    return Size(double.infinity, kToolbarHeight);
  }
}
