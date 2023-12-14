import 'package:flutter/material.dart';
import 'package:muslim_dialy_guide/app/core/utils/values.dart';
import 'package:muslim_dialy_guide/app/data/model/azkar_tabbar_component.dart';
import 'package:muslim_dialy_guide/app/view/screens/hisn_elmuslim/azkar_fehrs.dart';

class AzkarFehrsProvider extends ChangeNotifier {
  final List<AzkarTabBarComponentsModel> azkarTabBarList = [
    AzkarTabBarComponentsModel(
      title: GlobalAppStrings.index,
      widget: const AzkarFehrs(),
    ),
    AzkarTabBarComponentsModel(
      title: GlobalAppStrings.favouriteContent,
      widget:   Container(
      color: Colors.black,
    ),
    ),
    AzkarTabBarComponentsModel(
      title: GlobalAppStrings.favouriteZikr,
      widget: const AzkarFehrs(),
    ),
  ];

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void moveTabBarToIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
