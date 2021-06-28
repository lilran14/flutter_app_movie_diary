import 'package:flutter/material.dart';
import 'package:flutter_app_movie_diary/core/services/movie_service.dart';
import 'package:flutter_app_movie_diary/core/theme/theme_config.dart';
import 'package:flutter_app_movie_diary/models/history_model.dart';
import 'package:intl/intl.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    Key? key,
    required this.historyData,
  }) : super(key: key);
  final HistoryModel historyData;
  @override
  Widget build(BuildContext context) {
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
                MovieService.imageUrlW200 + historyData.imageUrl,
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
              Text(historyData.title,
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
              Text(
                  DateFormat().format(DateTime.fromMicrosecondsSinceEpoch(
                      historyData.createdDate.microsecondsSinceEpoch)),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: ThemeColor.darkTextVariantColor,
                      fontWeight: FontWeight.w300))
            ],
          )),
        ],
      ),
    );
  }
}
