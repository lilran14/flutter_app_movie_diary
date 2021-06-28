import 'package:flutter/material.dart';
import 'package:flutter_app_movie_diary/controllers/history_controller.dart';

import 'package:flutter_app_movie_diary/core/theme/theme_config.dart';
import 'package:flutter_app_movie_diary/pages/main/pages/history/components/history_card.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      width: deviceSize.width,
      height: deviceSize.height,
      child: GetX<HistoryController>(
        init: Get.put<HistoryController>(HistoryController()),
        builder: (HistoryController historyController) {
          if (historyController.history.length > 0) {
            return ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: Gap.defaultPadding,
              ),
              padding: EdgeInsets.all(Gap.defaultPadding),
              itemBuilder: (context, index) => HistoryCard(
                historyData: historyController.history[index],
              ),
              itemCount: historyController.history.length,
            );
          } else if (historyController.history.length == 0) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    LineIcons.history,
                    color: Colors.white38,
                  ),
                  SizedBox(
                    height: Gap.defaultGap,
                  ),
                  Text("No History",
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white38))
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
