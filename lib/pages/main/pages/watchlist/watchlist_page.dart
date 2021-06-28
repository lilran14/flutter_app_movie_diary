import 'package:flutter/material.dart';
import 'package:flutter_app_movie_diary/pages/main/pages/watchlist/components/watchlist_card.dart';
import 'package:get/get.dart';

import 'package:flutter_app_movie_diary/controllers/watchlist_controller.dart';
import 'package:flutter_app_movie_diary/core/theme/theme_config.dart';

import 'package:line_icons/line_icons.dart';

class WatchlistPage extends StatelessWidget {
  const WatchlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      width: deviceSize.width,
      height: deviceSize.height,
      child: GetX<WatchlistController>(
        init: Get.put<WatchlistController>(WatchlistController()),
        builder: (WatchlistController watchlistController) {
          if (watchlistController.watchList.length > 0) {
            return ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: Gap.defaultPadding,
              ),
              padding: EdgeInsets.all(Gap.defaultPadding),
              itemBuilder: (context, index) => WatchlistCard(
                  watchlistData: watchlistController.watchList[index]),
              itemCount: watchlistController.watchList.length,
            );
          } else if (watchlistController.watchList.length == 0) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    LineIcons.gratipayGittip,
                    color: Colors.white38,
                  ),
                  SizedBox(
                    height: Gap.defaultGap,
                  ),
                  Text("No Watchlist",
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
