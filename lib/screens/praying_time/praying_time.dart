

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:muslim_dialy_guide/models/praying_time.dart';
import 'package:muslim_dialy_guide/widgets/app_bar.dart';
import 'package:muslim_dialy_guide/widgets/praying_time/praying_time_container.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../services/location_services.dart';
import '../../widgets/comming_soon/spinner.dart';

import 'package:geocoder/geocoder.dart';

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
    // getLocation(context);
    // getPrayerTimes();
  }
  @override
  void dispose() {
    super.dispose();
    // getLocation(context).dispose();
    // getPrayerTimes().dispose();
  }


  getLocation (BuildContext context) {
    var userLocation = Provider.of<UserLocation>(context);
    Constants.lat = userLocation?.latitude;
    Constants.long = userLocation?.longitude;
    print ( Constants.lat);
    print (Constants.long);
    print ("A7aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
  }

  getUserLocation() async {//call this async method from whereever you need
    LocationData myLocation;
    String error;
    Location location = new Location();
    try {
      myLocation = await location.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'please grant permission';
        print(error);
      }
      if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error = 'permission denied- please enable it from app settings';
        print(error);
      }
      myLocation = null;
    }
    var currentLocation = myLocation;
    final coordinates = new Coordinates(
        myLocation.latitude, myLocation.longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(
        coordinates);
    var first = addresses.first;
    address ='${first.locality}, ${first.adminArea}';

    print(' ${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}');
    return first;
  }

  @override
  Widget build(BuildContext context) {
    getLocation(context);
    getUserLocation();
    Constants.lat != null || Constants.long != null ? getPrayerTimes() : (){};
    return Scaffold(
      appBar: GlobalAppBar(
        title: "Praying time",
      ),
      body: SafeArea (
        child: Constants.lat == null || Constants.long == null ?
        /*-----------------------------------------------------------------------------------------------*/
        /*-------------------------------------  Spinner -----------------------------------*/
        /*-----------------------------------------------------------------------------------------------*/
        Center(child: Spinner(color: color2)) :
        Center(
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
