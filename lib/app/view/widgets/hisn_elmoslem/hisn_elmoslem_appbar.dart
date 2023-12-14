import 'package:flutter/material.dart';
import 'package:muslim_dialy_guide/app/core/utils/values.dart';
import 'package:muslim_dialy_guide/app/data/provider/azkar_provider/azkar_fehrs_provider.dart';
import 'package:muslim_dialy_guide/app/data/provider/theme_provider.dart';
import 'package:muslim_dialy_guide/app/view/common_widget.dart/theme_icon.dart';
import 'package:provider/provider.dart';

class HisnElmoslemAppBar extends StatelessWidget {
  final TabController controller;
  const HisnElmoslemAppBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    AzkarFehrsProvider azkarFehrsProvider =
        Provider.of<AzkarFehrsProvider>(context);
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    return SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: Text(
        GlobalAppStrings.hisnElmoslem,
        style: TextStyle(color: theme.theme ? Colors.white : Colors.black),
        // style: googleFontsGenerator(context, fontWeight: FontWeight.bold, color: GlobalAppColors.appPink),
      ),
      pinned: true,
      floating: true,
      snap: true,
      bottom: PreferredSize(
        preferredSize: const Size(GlobalAppSizes.s_0, GlobalAppSizes.s_48),
        child: TabBar(controller: controller, tabs: [
          ...List.generate(
            azkarFehrsProvider.azkarTabBarList.length,
            (index) {
              return Tab(
                child: Text(
                  azkarFehrsProvider.azkarTabBarList[index].title,
                  style: TextStyle(
                      color: theme.theme ? Colors.white : Colors.black),
                ),
              );
            },
          ),
        ]),
      ),
      actions: [
        themeIcon(theme, context),
      ],
      leading: IconButton(
        icon: Icon(GlobalAppIcons.arrowBackIos,
            color: Theme.of(context).colorScheme.secondary),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
