import 'package:flutter/material.dart';
import 'package:flutter_app_movie_diary/core/theme/theme_config.dart';
import 'package:flutter_app_movie_diary/core/widgets/block_button.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () => Get.back(), child: Icon(LineIcons.arrowLeft)),
          centerTitle: true,
          elevation: 0,
          title: Text("Profile"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: deviceSize.height * 0.1,
            ),
            Center(
              child: CircleAvatar(
                radius: deviceSize.width * 0.2,
              ),
            ),
            SizedBox(
              height: Gap.defaultPadding,
            ),
            Text("LilRan4",
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
            Text("radans.works@gmail.com",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: ThemeColor.darkTextVariantColor,
                    fontWeight: FontWeight.w300)),
            SizedBox(
              height: deviceSize.height * 0.1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Gap.defaultPadding),
              child: Row(
                children: [
                  Expanded(
                      child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      padding: EdgeInsets.all(Gap.defaultPadding),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ThemeColor.semanticBlueColor,
                      ),
                      child: Column(
                        children: [
                          Text("Watchlist",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(fontWeight: FontWeight.bold)),
                          Spacer(),
                          Text("40",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40)),
                          Spacer(),
                        ],
                      ),
                    ),
                  )),
                  SizedBox(
                    width: Gap.defaultPadding,
                  ),
                  Expanded(
                      child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      padding: EdgeInsets.all(Gap.defaultPadding),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ThemeColor.semanticPurpleColor,
                      ),
                      child: Column(
                        children: [
                          Text("Watched",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(fontWeight: FontWeight.bold)),
                          Spacer(),
                          Text("40",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40)),
                          Spacer(),
                        ],
                      ),
                    ),
                  )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(Gap.defaultPadding),
              child: BlockButton(
                textButton: "Log Out",
                onPressed: () => Get.offAllNamed("/login"),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
