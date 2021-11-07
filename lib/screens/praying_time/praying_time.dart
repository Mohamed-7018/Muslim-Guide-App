

import 'package:flutter/material.dart';
import 'package:muslim_dialy_guide/models/praying_time.dart';
import 'package:muslim_dialy_guide/widgets/app_bar.dart';
import 'package:muslim_dialy_guide/widgets/praying_time/praying_time_container.dart';

import '../../constants.dart';

class PrayingTime extends StatefulWidget {
  static const String routeName = 'prayingTime';

  @override
  _PrayingTimeState createState() => _PrayingTimeState();
}

class _PrayingTimeState extends State<PrayingTime> {

  /*-----------------------------------------------------------------------------------------------*/
  /*-------------------------------- praying photos list  -----------------------------------*/
  /*-----------------------------------------------------------------------------------------------*/
  List<String> photos = [
    "assets/praying_time/subuh.png",
    "assets/praying_time/sunrise.png",
    "assets/praying_time/zhur.png",
    "assets/praying_time/asr.png",
    "assets/praying_time/sunset.png",
    "assets/praying_time/magrib.png",
    "assets/praying_time/isyah.png",
  ];

  List<String> _prayerTimes = [];
  List<String> _prayerNames = [];
  String address = "Cairo, Egypt";

  /*-----------------------------------------------------------------------------------------------*/
  /*-------------------------------- get prater times  -----------------------------------*/
  /*-----------------------------------------------------------------------------------------------*/
  getPrayerTimes() {
    PrayerTime prayers = new PrayerTime();

    prayers.setTimeFormat(prayers.getTime12());
    prayers.setCalcMethod(prayers.getKarachi());
    prayers.setAsrJuristic(prayers.getHanafi());
    prayers.setAdjustHighLats(prayers.getAdjustHighLats());

    List<int> offsets = [
      0,
      0,
      0,
      0,
      0,
      0,
      0
    ]; // {Fajr,Sunrise,Dhuhr,Asr,Sunset,Maghrib,Isha}
    prayers.tune(offsets);

    var currentTime = DateTime.now();

    setState(() {
      _prayerTimes = prayers.getPrayerTimes(
          currentTime, Constants.lat, Constants.long, Constants.timeZone);
      _prayerNames = prayers.getTimeNames();
    });
  }


  @override
  void initState() {
    super.initState();

    getPrayerTimes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: "Praying time",
      ),
      body: SafeArea (
        child: Center(
          child: Container (
            child: Column (
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ignore: deprecated_member_use
                FlatButton.icon(
                    onPressed: (){},
                    icon: Icon(Icons.location_on_outlined),
                    label: Text (
                      address
                    ),
                ),
                Container(
                  //width: double.infinity,
                  child: Image.asset(
                    'assets/mecca.png',
                    width: 300,
                  ),
                ),
                Expanded(
                  child: Container(
                  //  height: MediaQuery.of(context).size.height * 0.2,
                    child: ListView.builder(
                      itemCount: _prayerNames.length,
                      itemBuilder: (BuildContext context, position) {
                        return Container(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PrayingTimeContainer(
                                icon: photos[position],
                                title: _prayerNames[position],
                                time: _prayerTimes[position],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
