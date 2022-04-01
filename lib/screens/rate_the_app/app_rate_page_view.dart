import 'package:flutter/material.dart';

import 'feedbacks_page.dart';
import 'rate_the_app.dart';

class AppRatePageView extends StatefulWidget {
  static String routeName = "/rateApp";

  @override
  _AppRatePageViewState createState() => _AppRatePageViewState();
}

class _AppRatePageViewState extends State<AppRatePageView> {

  PageController controller = PageController(initialPage: 0);
  List boxes;

  @override
  void initState() {
    super.initState();
    boxes = [
      RateTheAppPage(controller: controller),
      FeedbackScreen(controller: controller)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: controller,
        scrollDirection: Axis.vertical,
        itemCount: 2,
        itemBuilder: (context, index) => boxes[index],
      ),
    );
  }
}