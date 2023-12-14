import 'package:flutter/material.dart';
import 'package:muslim_dialy_guide/app/data/provider/azkar_provider/azkar_fehrs_provider.dart';
import 'package:muslim_dialy_guide/app/view/widgets/hisn_elmoslem/hisn_elmoslem_appbar.dart';
import 'package:provider/provider.dart';

class AzkarMainScreen extends StatefulWidget {
  static const String routeName = '/azkarMainScreen';
  const AzkarMainScreen({super.key});

  @override
  State<AzkarMainScreen> createState() => _AzkarMainScreenState();
}

class _AzkarMainScreenState extends State<AzkarMainScreen>
    with TickerProviderStateMixin {
   late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            HisnElmoslemAppBar(
              controller: _tabController,
            ),
          ];
        },
        body: Selector<AzkarFehrsProvider, int>(
          selector: (context, value) => value.currentIndex,
          builder: (context, value, child) {
            return Selector<AzkarFehrsProvider,List>(
              selector: (context, value) =>value.azkarTabBarList ,
              builder: (context,value,child) {
                return TabBarView(
                  physics: const BouncingScrollPhysics(),
                  controller: _tabController,
                  children: [
                    ...List.generate(
                      value.length,
                      (index) {
                        return value[index].widget;
                      },
                    ),
                  ],
                );
              }
            );
          },
        ),
      ),
    );
  }
}
