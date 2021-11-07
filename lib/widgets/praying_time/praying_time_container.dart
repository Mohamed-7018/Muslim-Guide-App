import 'package:flutter/material.dart';

import '../../constants.dart';


class PrayingTimeContainer extends StatelessWidget {
  final String icon;
  final String title;
  final String time;
  PrayingTimeContainer({this.icon, this.title, this.time});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 70,
        width: 330,
        color: color2,
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Image.asset(
              '$icon',
              width: 40,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                '$title',
                style: TextStyle(
                    fontSize: 20,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Text(
                '$time',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
