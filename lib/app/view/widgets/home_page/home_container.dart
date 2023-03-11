import 'package:flutter/material.dart';
import 'package:muslim_dialy_guide/app/core/utils/values.dart';

class HomeContainer extends StatelessWidget {
  final String image;
  final Color color;
  final String title;

  const HomeContainer(
      {Key ?  key,
      required this.image,
      required this.color,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(GlobalAppSizes.s_8),
      child: Stack(
        children: [
          Opacity(
            opacity: GlobalAppSizes.s_0p8,
            child: Container(
              width: (MediaQuery.of(context).size.width - GlobalAppSizes.s_60) / GlobalAppSizes.s_2,
              height: GlobalAppSizes.s_240,
              decoration: BoxDecoration(
                color: color,
                image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(GlobalAppSizes.s_20),
              ),
            ),
          ),
          Container(
            width: (MediaQuery.of(context).size.width - GlobalAppSizes.s_60) / GlobalAppSizes.s_2,
            decoration: BoxDecoration(
              border: Border.all(color: GlobalAppColors.appPink, width: 2),
              color: GlobalAppColors.appBlue.withOpacity(0.7),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(GlobalAppSizes.s_20),
                  topRight: Radius.circular(GlobalAppSizes.s_20),
              ),
            ),
            child: Center(
              child: Container(
                padding: const EdgeInsets.only(top: GlobalAppSizes.s_10,bottom: GlobalAppSizes.s_10, right: 10, left: GlobalAppSizes.s_10),
                child: Text(
                  title,
                  style: TextStyle(color: GlobalAppColors.kScaffoldLight, fontSize: GlobalAppSizes.s_15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
