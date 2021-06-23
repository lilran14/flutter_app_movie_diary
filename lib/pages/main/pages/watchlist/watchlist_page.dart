import 'package:flutter/material.dart';
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
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          height: Gap.defaultPadding,
        ),
        padding: EdgeInsets.all(Gap.defaultPadding),
        itemBuilder: (context, index) => WatchlistCard(),
        itemCount: 10,
      ),
    );
  }
}

class WatchlistCard extends StatelessWidget {
  const WatchlistCard({
    Key? key,
  }) : super(key: key);

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
                "https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2021/06/18/386827737.jpg",
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
              Text("Ali & Ratu-ratu Queens",
                  maxLines: 2,
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
                  Text("8.0",
                      maxLines: 2,
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
          InkWell(child: Icon(LineIcons.verticalEllipsis))
        ],
      ),
    );
  }
}
