import 'package:flutter/material.dart';
import 'package:flutter_app_movie_diary/controllers/auth_controller.dart';
import 'package:flutter_app_movie_diary/core/services/firestore_database.dart';
import 'package:flutter_app_movie_diary/core/services/movie_service.dart';
import 'package:flutter_app_movie_diary/core/theme/theme_config.dart';
import 'package:flutter_app_movie_diary/models/watchlist_model.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class WatchlistCard extends StatelessWidget {
  const WatchlistCard({
    Key? key,
    required this.watchlistData,
  }) : super(key: key);

  final WatchlistModel watchlistData;

  @override
  Widget build(BuildContext context) {
    String uid = Get.find<AuthController>().user.value.id!;
    return Container(
      padding: EdgeInsets.all(Gap.defaultGap + 5),
      width: double.infinity,
      height: 85,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ThemeColor.darkBackgroundVariantColor),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                MovieService.imageUrlW200 + watchlistData.imageUrl,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SizedBox(
            width: Gap.defaultGap,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(watchlistData.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontWeight: FontWeight.bold)),
              SizedBox(
                height: Gap.defaultGap / 2,
              ),
              Row(
                children: [
                  Icon(
                    LineIcons.starAlt,
                    color: Color(0xFF9BFE5E),
                    size: 14,
                  ),
                  SizedBox(
                    width: Gap.defaultGap / 2,
                  ),
                  Text(watchlistData.score.toStringAsFixed(1),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: Color(0xFF9BFE5E))),
                ],
              ),
            ],
          )),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 'add',
                  child: Text('Already Watch'),
                ),
                PopupMenuItem(
                  value: 'delete',
                  child: Text('Delete'),
                )
              ];
            },
            onSelected: (String value) {
              switch (value) {
                case "add":
                  FireStoreDB().addHistory(uid, watchlistData);
                  FireStoreDB().updateWathlist(uid, watchlistData.id!);
                  break;
                case "delete":
                  FireStoreDB().deleteWachlist(uid, watchlistData.id!);
                  break;
                default:
                  throw ("Something wrong!");
              }
            },
          ),
        ],
      ),
    );
  }
}
