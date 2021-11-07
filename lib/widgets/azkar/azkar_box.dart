import 'package:auto_direction/auto_direction.dart';
import 'package:flutter/material.dart';
import 'package:linkwell/linkwell.dart';

import 'number_buttons.dart';

class AzkarPostDescription extends StatefulWidget {
  final String description;
  final int number;


  const AzkarPostDescription({Key key,
   @required this.description,
  @required this.number,
  }
  ) : super(key: key);

  @override
  _AzkarPostDescriptionState createState() => _AzkarPostDescriptionState();
}

class _AzkarPostDescriptionState extends State<AzkarPostDescription> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          margin:
          const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.pink[700], width: 2),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)),
            color: Colors.white.withOpacity(0.2),
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              //Box is here
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AutoDirection(
                      text: widget.description,
                      child: LinkWell(
                        widget.description,
                        style: Theme.of(context).textTheme.subtitle2.copyWith(
                          fontSize: 16,
                          height: 1.5,
                        ),
                        linkStyle: TextStyle(
                          height: 1.5,
                          color: Colors.deepOrange[300],
                          decoration: TextDecoration.underline,
                        ),
                        // textAlign: TextAlign.justify,
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0)
              .copyWith(bottom: 8.0),
          child: Row(
            children: [
              const SizedBox(width: 8.0),
              widget.number == null ? Container () : PostBtn(
              n: widget.number,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
