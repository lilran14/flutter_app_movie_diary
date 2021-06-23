import 'package:flutter/material.dart';
import 'package:flutter_app_movie_diary/core/constants/assets_url.dart';
import 'package:flutter_app_movie_diary/core/theme/theme_config.dart';

class LoginIllustration extends StatelessWidget {
  const LoginIllustration({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Gap.defaultPadding),
      child: Image.asset(AssetsURL.imageUrl + "login_illustration.png"),
    );
  }
}
