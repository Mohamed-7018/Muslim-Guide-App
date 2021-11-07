


import 'package:flutter/material.dart';
import 'package:muslim_dialy_guide/widgets/app_bar.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:muslim_dialy_guide/widgets/qibla/loading_indicator.dart';
import 'package:muslim_dialy_guide/widgets/qibla/qibla_camps.dart';
import 'package:muslim_dialy_guide/widgets/qibla/qibla_maps.dart';


class QiblaPage extends StatelessWidget {
  static const String routeName = 'QiblaPage';

  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GlobalAppBar(
      title: "El-Qibla",
    ),
      body: Container (
        child: FutureBuilder (
          future: _deviceSupport ,
          builder: (_, AsyncSnapshot<bool> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return LoadingIndicator();
            if (snapshot.hasError)
              return Center(
                child: Text("Error: ${snapshot.error.toString()}"),
              );

            if (snapshot.data)
              return QiblahCompass();
            else
              return QiblahMaps();
          },
        ),
      ),
    );
  }
}
