import 'package:flutter/material.dart';
import 'package:muslim_dialy_guide/app/core/utils/values.dart';
import 'package:muslim_dialy_guide/app/data/provider/theme_provider.dart';
import 'package:muslim_dialy_guide/app/view/common_widget.dart/theme_icon.dart';
import 'package:provider/provider.dart';

class GlobalAppBar extends PreferredSize {
  final String title;
  final bool isHomePage;

  GlobalAppBar({Key? key,required this.title,required this.isHomePage})
      : super(
          key: key,
          preferredSize: const Size.fromHeight(72),
          child: AppBar(),
        );

  @override
  Widget build(BuildContext context) {
    final ThemeProvider theme = Provider.of<ThemeProvider>(context);
    return AppBar(
    
      title: Text(
        title,
       // style: googleFontsGenerator(context, fontWeight: FontWeight.bold, color: GlobalAppColors.appPink),
      ),
      centerTitle: true,
      elevation: GlobalAppSizes.s_0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      actions: [
        isHomePage ? Container() : themeIcon(theme, context),
      ],
      leading: isHomePage ? themeIcon(theme, context) :   IconButton(
        icon: Icon(GlobalAppIcons.arrowBackIos,
            color: Theme.of(context).colorScheme.secondary),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  @override
  Size get preferredSize {
    return const Size(double.infinity, kToolbarHeight);
  }
}
