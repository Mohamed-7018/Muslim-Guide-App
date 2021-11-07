import 'package:flutter/material.dart';
import 'package:muslim_dialy_guide/constants.dart';

class HomeContainer extends StatelessWidget {
  final String image;
  final Color color;
  final String title;

  const HomeContainer(
      {Key key,
      @required this.image,
      @required this.color,
      @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Opacity(
            opacity: 0.8,
            child: Container(
              width: (MediaQuery.of(context).size.width - 60) / 2,
              height: 240,
              decoration: BoxDecoration(
                color: color,
                image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Container(
            width: (MediaQuery.of(context).size.width - 60) / 2,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.pink[700], width: 2),
              color: kCustomsColor.withOpacity(0.7),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
              ),
            ),
            child: Center(
              child: Container(
                padding: const EdgeInsets.only(top: 10,bottom: 10, right: 10, left: 10),
                child: Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
