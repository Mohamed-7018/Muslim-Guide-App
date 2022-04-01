import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flare_flutter/flare_actor.dart';

import '../../constants.dart';

class RateTheAppPage extends StatefulWidget {

  final PageController controller ;
  const RateTheAppPage({Key key, this.controller}) : super(key: key);

  @override
  _RateTheAppPageState createState() => _RateTheAppPageState();
}

class _RateTheAppPageState extends State<RateTheAppPage> {
  String feel = "0";
  double _value = 0.0;
  double lastsection = 0.0;
  String feedbacktxt = "Very Poor";
  Color backgroundclr = Colors.red;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundclr,
        body: Stack(
          children: <Widget>[
            Center(
              child: FlareActor(
                'assets/flares/feelings.flr',
                fit: BoxFit.contain,
                alignment: Alignment.center,
                animation: feel,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column (
                  children: [

                    SizedBox(
                      height: 60,
                    ),
                    _buildHeaderText(),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 60),
                      child: Text(
                        feedbacktxt,
                        style: TextStyle(
                          fontSize: 36,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Container (
                  child: Column (
                    children: [
                      Slider(
                        min: 0.0,
                        max: 100.0,
                        value: _value,
                        divisions: 100,
                        activeColor: Colors.blue,
                        inactiveColor: Colors.black,
                        label: 'Set a value',
                        onChanged: (val) {
                          setState(() {
                            _value = val;
                          });
                          if (_value == 0.0) {
                            if (lastsection > 0.0) {
                              setState(() {
                                feel = "0-";
                              });
                            }
                            setState(() {
                              lastsection = 0.0;
                              backgroundclr = Colors.red;
                              feedbacktxt = "Very Poor";
                              Constants.rate =  feedbacktxt;
                              print (Constants.rate);

                            });
                          } else if (_value > 0.0 && _value < 25.0) {
                            if (lastsection == 0.0) {
                              setState(() {
                                feel = "0+";
                              });
                            } else if (lastsection == 50.0) {
                              setState(() {
                                feel = "25-";
                              });
                            }
                            setState(() {
                              lastsection = 25.0;
                              backgroundclr = Colors.orange;
                              feedbacktxt = "Poor";
                              Constants.rate =  feedbacktxt;
                              print (Constants.rate);

                            });
                          } else if (_value >= 25.0 && _value < 50.0) {
                            if (lastsection == 25.0) {
                              setState(() {
                                feel = "25+";
                              });
                            } else if (lastsection == 75.0) {
                              setState(() {
                                feel = "50-";
                              });
                            }
                            setState(() {
                              lastsection = 50.0;
                              backgroundclr = Colors.orangeAccent;
                              feedbacktxt = "Below Average";
                              Constants.rate =  "Below Average";
                              print (Constants.rate);
                            });
                          } else if (_value >= 50.0 && _value < 75.0) {
                            if (lastsection == 50.0) {
                              setState(() {
                                feel = "50+";
                              });
                            } else if (lastsection == 100.0) {
                              setState(() {
                                feel = "75-";
                              });
                            }
                            setState(() {
                              lastsection = 75.0;
                              backgroundclr = Colors.yellow;
                              feedbacktxt = "Above Average";
                              Constants.rate =  feedbacktxt;
                              print (Constants.rate);
                            });
                          } else if (_value >= 75.0 && _value <= 100.0) {
                            if (lastsection == 75.0) {
                              setState(() {
                                feel = "75+";
                              });
                            }
                            setState(() {
                              lastsection = 100.0;
                              backgroundclr = Colors.green;
                              feedbacktxt = "Excellent";
                              Constants.rate =  feedbacktxt;
                              print (Constants.rate);
                            });
                          }
                        },
                      ),
                      _buildButton(),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderText () {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Text (
        "How Was your Experience?",
        textAlign: TextAlign.center,
        style: GoogleFonts.cookie(
          color: Colors.white,
          fontSize: 40,
        ),
      ),
    );
  }



  Widget  _buildButton () {
    return Column (
      children: [
/*---------------------------------------------------------------------------------------*/
/*-----------------------------------  Arrow Down Btn  ----------------------------------*/
/*---------------------------------------------------------------------------------------*/
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: color2, width: 3.5),
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_downward_outlined),
            onPressed: () {
              widget.controller.animateToPage(
                1,
                duration: const Duration(milliseconds: 1200),
                curve: Curves.fastOutSlowIn,
              );
            },
          ),
        ),
      ],
    );
  }
}
