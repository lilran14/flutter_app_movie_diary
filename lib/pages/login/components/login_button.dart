import 'package:flutter/material.dart';
import 'package:flutter_app_movie_diary/core/theme/theme_config.dart';
import 'package:flutter_app_movie_diary/core/widgets/block_button_with_icon.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class LoginCaption extends StatelessWidget {
  const LoginCaption({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "By Continuing You Agree\nTems of Services & Privacy Policy",
      style: Theme.of(context)
          .textTheme
          .caption!
          .copyWith(color: ThemeColor.darkTextVariantColor),
      textAlign: TextAlign.center,
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlockButtonWithIcon(
      textButton: "Login With Google",
      icon: Icon(LineIcons.googlePlus),
      onPressed: () {
        Get.offAllNamed("/home");
      },
    );
  }
}
