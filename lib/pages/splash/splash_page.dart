import 'package:flutter/material.dart';
import 'package:flutter_app_movie_diary/core/constants/assets_url.dart';
import 'package:flutter_app_movie_diary/core/theme/theme_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(Gap.defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: deviceSize.height * 0.2,
            ),
            Center(
                child: SvgPicture.asset(
              AssetsURL.imageUrl + "app_logo.svg",
              width: deviceSize.width * 0.4,
            )),
            SizedBox(
              height: Gap.defaultGap,
            ),
            Text("Movie Diary", style: Theme.of(context).textTheme.headline1),
            SizedBox(
              height: 5,
            ),
            Text("Your Movie Tracker",
                style: Theme.of(context).textTheme.headline5),
            Spacer(),
            Text("Made w/ 💜 by Lilran14",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: ThemeColor.darkTextVariantColor)),
            SizedBox(
              height: Gap.defaultGap,
            ),
          ],
        ),
      ),
    );
  }
}
