import 'package:flutter/material.dart';
import 'package:muslim_dialy_guide/app/core/utils/values.dart';

class FehrsTitleCard extends StatelessWidget {
  final int index;
  final String fehresTitle;
  const FehrsTitleCard({
    super.key,
    required this.index,
    required this.fehresTitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: index%2 !=0 ? GlobalAppColors.appBlue.withOpacity(0.5) : null,
    );
  }
}
