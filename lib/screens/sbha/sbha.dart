import 'package:flutter/material.dart';
import 'package:muslim_dialy_guide/widgets/app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';

class SbhaScreen extends StatefulWidget {
  static const String routeName = 'sbhaScreen';

  @override
  _SbhaScreenState createState() => _SbhaScreenState();
}

class _SbhaScreenState extends State<SbhaScreen> {
  int _counter = 0;
  bool isClick = true;
  _dismissDialog() {
    Navigator.pop(context);
  }
  void _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Notification',textAlign: TextAlign.right,),
            content: Text('Clear the history',textAlign: TextAlign.left,),
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                  onPressed: () {
                    _dismissDialog();
                  },
                  child: Text('No')),
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () {
                  _dismissDialog();
                  removeCounter();
                  setState(() {
                    _counter=0;
                  });
                },
                child: Text('yes'),
              )
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    getCounter();
  }

  /*-----------------------------------------------------------------------------------------------*/
  /*---------------------------- get counter from shared preferences ------------------------------*/
  /*-----------------------------------------------------------------------------------------------*/
  getCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt("counter") ?? 0);
    });
  }

  /*-----------------------------------------------------------------------------------------------*/
  /*---------------------------- Set counter to shared preferences ------------------------------*/
  /*-----------------------------------------------------------------------------------------------*/
  setCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("counter", _counter);
  }
  /*-----------------------------------------------------------------------------------------------*/
  /*---------------------------- delete counter from shared preferences ------------------------------*/
  /*-----------------------------------------------------------------------------------------------*/
  removeCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("counter");
  }

  Widget build(BuildContext context) {
    return Scaffold(
            appBar: GlobalAppBar(
              title: "sbha"
            ),
            body: ListView(
              children: <Widget>[
                Center(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 250,
                      width: 250,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/azkar/sbha.png',
                          ),
                        ),
                      ),
                      child: Center(
                          child: Text(
                            '$_counter',
                            style: TextStyle(fontSize: 40.0),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            _counter++;
                          });
                          setCounter();
                        },
                        child: Container(
                          height: 60.0,
                          width: 180.0,
                          decoration: BoxDecoration(
                            color: kCustomsColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                              child: Text(
                                'Press me',
                                style: TextStyle(
                                    fontSize: 25.0, fontWeight: FontWeight.bold,
                                ),
                              )),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){_showMaterialDialog();},
                      child: Container(
                        height: 60.0,
                        width: 140.0,
                        decoration: BoxDecoration(
                          color: color2,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Text('Clear',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            //color: Colors.white,
                          ),),
                        ),

                      ),
                    )
                  ],
                ),
              ],
            )
    );
  }
}
