// 
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyResponsiveHelper extends StatelessWidget {
  const MyResponsiveHelper({
    required this.mobileBuilder,
    required this.tabletBuilder,
    required this.desktopBuilder,
    Key? key,
  }) : super(key: key);

  final Widget Function(
    BuildContext context,
    BoxConstraints constraints,
  ) mobileBuilder;

  final Widget Function(
    BuildContext context,
    BoxConstraints constraints,
  ) tabletBuilder;

  final Widget Function(
    BuildContext context,
    BoxConstraints constraints,
  ) desktopBuilder;

  static bool isWeb() {
    return kIsWeb;
  }
    static bool isMobilePhone() {
    if (!kIsWeb) {
      return true;
    }else {
      return false;
    }
  }
  
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1300 &&
      MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1300;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1300) {
          return desktopBuilder(context, constraints);
        } else if (constraints.maxWidth >= 650) {
          return tabletBuilder(context, constraints);
        } else {
          return mobileBuilder(context, constraints);
        }
      },
    );
  }
}
