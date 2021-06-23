import 'package:flutter/material.dart';
import 'package:flutter_app_movie_diary/core/theme/theme_config.dart';
import 'package:flutter_app_movie_diary/core/widgets/block_button.dart';
import 'package:flutter_app_movie_diary/core/widgets/outline_block_button.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            InkWell(onTap: () => Get.back(), child: Icon(LineIcons.arrowLeft)),
        centerTitle: true,
        elevation: 0,
        title: Text("Movie Details"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.only(bottom: Gap.defaultMargin),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: Gap.defaultPadding,
              ),
              Center(
                child: Container(
                  width: 183,
                  height: 250,
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Image.network(
                    "https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2021/06/18/386827737.jpg",
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              SizedBox(
                height: Gap.defaultPadding,
              ),
              Text("Ali & Ratu-Ratu Queens",
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
              Text("Lucky Kuswandi",
                  softWrap: false,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: ThemeColor.darkTextVariantColor,
                      fontWeight: FontWeight.w300)),
              SizedBox(
                height: Gap.defaultGap / 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Chip(label: Text("Family")),
                  SizedBox(
                    width: Gap.defaultGap,
                  ),
                  Chip(label: Text("Comedy"))
                ],
              ),
              SizedBox(
                height: Gap.defaultPadding,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Gap.defaultPadding),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Description",
                  softWrap: false,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: Gap.defaultGap,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Gap.defaultPadding),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Volutpat consectetur est fringilla commodo. Fermentum adipiscing diam risus natoque eget mi praesent. Ornare sed at malesuada phasellus. ",
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontWeight: FontWeight.w300),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(Gap.defaultPadding),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlineBlockButton(
                        textButton: "Add to Watchlist",
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      width: Gap.defaultPadding,
                    ),
                    Expanded(
                      child: BlockButton(
                        textButton: "Already Watch",
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
