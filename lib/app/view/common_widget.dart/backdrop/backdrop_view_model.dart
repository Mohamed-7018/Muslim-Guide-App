import 'package:flutter/material.dart';

mixin DashboardScreenViewModel {
  static void toggleSettings(
      ValueNotifier<bool> isSettingsOpenNotifier,
      AnimationController settingsPanelController,
      AnimationController iconController) {
    // Animate the settings panel to open or close.
    if (isSettingsOpenNotifier.value) {
      settingsPanelController.reverse();
      iconController.reverse();
    } else {
      settingsPanelController.forward();
      iconController.forward();
    }
    isSettingsOpenNotifier.value = !isSettingsOpenNotifier.value;
  }
}