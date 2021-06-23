import 'package:flutter/material.dart';
import 'package:flutter_app_movie_diary/core/constants/assets_url.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(4),
            child: SvgPicture.asset(
              AssetsURL.imageUrl + "app_logo.svg",
              width: 48,
              height: 48,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Movie Diary", style: Theme.of(context).textTheme.headline1),
              Text("Your Movie Tracker",
                  style: Theme.of(context).textTheme.headline5)
            ],
          )
        ],
      ),
    );
  }
}
