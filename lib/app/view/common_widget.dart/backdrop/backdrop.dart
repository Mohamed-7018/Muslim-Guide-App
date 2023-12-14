import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muslim_dialy_guide/app/core/helper/responsive_helper.dart';
import 'package:muslim_dialy_guide/app/core/utils/values.dart';
import 'package:muslim_dialy_guide/app/view/common_widget.dart/backdrop/backdrop_view_model.dart';
import 'package:muslim_dialy_guide/app/view/common_widget.dart/backdrop/setting_icon_widget.dart';

class BackDropMenu extends StatefulWidget {
  const BackDropMenu({
    super.key,
    required this.settingPage,
    required this.homePage,
  });
  final Widget settingPage;
  final Widget homePage;
  @override
  State<BackDropMenu> createState() => _BackDropMenuState();
}

class _BackDropMenuState extends State<BackDropMenu>
    with TickerProviderStateMixin {
  late AnimationController _drawerPanelController;
  late AnimationController _drawerIconController;
  late ValueNotifier<bool> _isDrawerOpenNotifier;

  @override
  void initState() {
    _drawerPanelController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: GlobalAppSizes.s_200.toInt(),
      ),
    );
    _drawerIconController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: GlobalAppSizes.s_500.toInt(),
      ),
    );
    _isDrawerOpenNotifier = ValueNotifier(false);
    super.initState();
  }

  @override
  void dispose() {
    _drawerPanelController.dispose();
    _drawerIconController.dispose();
    _isDrawerOpenNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: [
            widget.homePage,
            ValueListenableBuilder<bool>(
              valueListenable: _isDrawerOpenNotifier,
              builder: (context, isSettingsOpen, child) {
                if (isSettingsOpen) {
                  return ExcludeSemantics(
                    child: Listener(
                      onPointerDown: (_) =>
                          DashboardScreenViewModel.toggleSettings(
                              _isDrawerOpenNotifier,
                              _drawerPanelController,
                              _drawerIconController),
                      child: const ModalBarrier(dismissible: false),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
            ScaleTransition(
              alignment: Directionality.of(context) == TextDirection.ltr
                  ? Alignment.topRight
                  : Alignment.topLeft,
              scale: CurvedAnimation(
                parent: _drawerPanelController,
                curve: Curves.easeIn,
                reverseCurve: Curves.easeOut,
              ),
              child: Align(
                alignment: AlignmentDirectional.topEnd,
                child: Material(
                  elevation: GlobalAppSizes.s_7,
                  clipBehavior: Clip.antiAlias,
                  borderRadius: GlobalAppBorderRadius.r_40,
                  color: GlobalAppColors.appBlue,
                  child: Container(
                    constraints: const BoxConstraints(
                      maxHeight: GlobalAppSizes.s_560,
                      maxWidth: GlobalAppSizes.s_520,
                      minWidth: GlobalAppSizes.s_520,
                    ),
                    child: widget.settingPage,
                  ),
                ),
              ),
            ),

            /*------------------------------------------*/
            /*-------- setting icon --------------------*/
            /*------------------------------------------*/
            _SettingsIcon(
              animationController: _drawerIconController,
              toggleSettings: () => DashboardScreenViewModel.toggleSettings(
                  _isDrawerOpenNotifier,
                  _drawerPanelController,
                  _drawerIconController),
              isSettingsOpenNotifier: _isDrawerOpenNotifier,
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsIcon extends AnimatedWidget {
  const _SettingsIcon({
    required this.animationController,
    required this.toggleSettings,
    required this.isSettingsOpenNotifier,
  }) : super(listenable: animationController);

  final AnimationController animationController;
  final VoidCallback toggleSettings;
  final ValueNotifier<bool> isSettingsOpenNotifier;
  //

  @override
  Widget build(BuildContext context) {
    final isDesktop = kIsWeb
        ? MyResponsiveHelper.isDesktop(context) ||
            MyResponsiveHelper.isTablet(context)
        : MyResponsiveHelper.isDesktop(context) ||
            MyResponsiveHelper.isTablet(context) ||
            Platform.isWindows ||
            Platform.isMacOS ||
            Platform.isLinux;

    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: SizedBox(
        width: GlobalAppSizes.s_64,
        height: isDesktop
            ? GlobalAppSizes.s_56
            : GlobalAppSizes.s_40 + MediaQuery.of(context).padding.top,
        child: Material(
          borderRadius: const BorderRadiusDirectional.only(
            bottomStart: GlobalAppRadius.r_15,
          ),
          // color: isSettingsOpenNotifier.value == true
          color:
              isSettingsOpenNotifier.value // & !animationController.isAnimating
                  ? Colors.transparent
                  : Theme.of(context).scaffoldBackgroundColor,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              toggleSettings();
            },
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 3, end: 18),
              child: SettingsIcon(animationController.value),
            ),
          ),
        ),
      ),
    );
  }
}
