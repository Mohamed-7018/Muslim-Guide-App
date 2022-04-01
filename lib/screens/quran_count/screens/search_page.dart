import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslim_dialy_guide/screens/quran_count/component/loading_widget.dart';
import 'package:muslim_dialy_guide/screens/quran_count/component/rounded_numbers.dart';
import 'package:muslim_dialy_guide/screens/quran_count/constants.dart';
import 'package:muslim_dialy_guide/screens/quran_count/controllers/search_controller.dart';

import '../constants.dart';

class SearchPage extends StatelessWidget {
  final _controller = Get.put(SearchController());

  Widget itemBuilder(context, index) {
    final verse = _controller.foundedVerses[index];
    return Card(
      child: ListTile(
        subtitle: SelectableText(
          verse.text,
          style: kTextStyle,
        ),
        title: SelectableText(
          verse.surah,
          style: kTextStyle,
        ),
        leading: IconCircularNum(
          number: verse.num,
        ),
        enabled: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: _controller.isBusy
              ? LoadingWidget()
              : Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        onChanged: (value) {
                          _controller.searchByWord(value);
                        },
                        decoration: InputDecoration(
                          hintText: 'كلمة البحث',
                          suffixIcon: Icon(
                            Icons.search,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        child: ListTile(
                          title: Text(
                            'تكررت ${_controller.repeatCount}',
                            textAlign: TextAlign.center,
                            style: kTextStyle,
                          ),
                          enabled: true,
                        ),
                      ),
                      Expanded(
                        child: Obx(
                          () => Scrollbar(
                            child: ListView.builder(
                              itemCount: _controller.foundedVerses.length,
                              itemBuilder: itemBuilder,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
