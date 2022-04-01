import 'package:flutter/material.dart';
import 'package:screen/screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:muslim_dialy_guide/globals/globals.dart' as globals;
class SliderAlert extends StatefulWidget {
  @override
  _SliderAlertState createState() => _SliderAlertState();
}

class _SliderAlertState extends State<SliderAlert> {
  SharedPreferences prefs;
  double tempBrightnessLevel;

  setBrightnessLevel(double level) async {
    globals.brightnessLevel = level;
    prefs = await SharedPreferences.getInstance();
    prefs.setDouble(globals.BRIGHTNESS_LEVEL, globals.brightnessLevel);
  }

  @override
  void initState() {
    if (globals.brightnessLevel != null) {
      setState(() {
        tempBrightnessLevel = globals.brightnessLevel;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        title: Text("Screen brightness", textDirection: TextDirection.rtl),
        content: Container(
          height: 24,
          child: Row(
            children: <Widget>[
              Icon(
                Icons.highlight,
                size: 24,
              ),
              Slider(
                value: tempBrightnessLevel,
                onChanged: (_brightness) {
                  setState(() {
                    tempBrightnessLevel = _brightness;
                  });
                  Screen.setBrightness(tempBrightnessLevel);
                },
                max: 1,
                label: "$tempBrightnessLevel",
                divisions: 10,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          // ignore: deprecated_member_use
          FlatButton(
              child: Text(
                "Cancel",
                textDirection: TextDirection.rtl,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          // ignore: deprecated_member_use
          FlatButton(
            child: Text(
              "Save",
              textDirection: TextDirection.rtl,
            ),
            onPressed: () {
              setBrightnessLevel(tempBrightnessLevel);
              Navigator.of(context).pop();
              Fluttertoast.showToast(
                  msg: "Saved Successfully",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 18.0);
            },
          ),
        ],
      ),
    );
  }
}
