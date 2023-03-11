import 'package:flutter/material.dart';
import 'package:muslim_dialy_guide/app/core/utils/values.dart';
import 'package:muslim_dialy_guide/app/data/provider/theme_provider.dart';
import 'package:muslim_dialy_guide/app/view/common_widget.dart/theme_icon.dart';
import 'package:muslim_dialy_guide/app/view/widgets/home_page/custom_box.dart';
import 'package:provider/provider.dart';

class CustomBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);

    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
            child: Container(
          height: GlobalAppSizes.s_250,
        )),
        Positioned(
          top: - GlobalAppSizes.s_40,
          right: - GlobalAppSizes.s_50,
          child: CustomBox(
            angulo: GlobalAppSizes.s_1p6,
            color: GlobalAppColors.appPink,
          ),
        ),
        Positioned(
          top: - GlobalAppSizes.s_40,
          right: - GlobalAppSizes.s_60,
          child: CustomBox(
            angulo:GlobalAppSizes.s_1p2,
            color: GlobalAppColors.appBlue,
          ),
        ),
        Positioned(
          child: _crearContenido(theme, context),
        ),
      ],
    );
  }
}

Widget _crearContenido(theme, BuildContext context) {
  return Container(
      height:  GlobalAppSizes.s_250,
      margin: GlobalAppEdgeInsets.t30r10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "  ",
            style:GlobalAppStyles.customBackgroundTextStyle,
          ),
          Text(
            GlobalAppStrings.muslimGuide,
            style:GlobalAppStyles.customBackgroundTextStyle,
          ),
          SizedBox(
            height:  GlobalAppSizes.s_30,
          ),
          Text(
             GlobalAppStrings.appTheme,
            style:GlobalAppStyles.customBackgroundTextStyle,
          ),
          themeIcon(theme, context)
        ],
      ));
}
