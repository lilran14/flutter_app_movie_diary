import 'package:flutter/material.dart';
import 'package:flutter_app_movie_diary/pages/login/components/login_button.dart';
import 'package:flutter_app_movie_diary/pages/login/components/login_illustration.dart';
import 'package:flutter_app_movie_diary/pages/login/components/login_title.dart';

import 'package:flutter_app_movie_diary/core/theme/theme_config.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(Gap.defaultPadding),
        child: Column(
          children: [
            SizedBox(
              height: deviceSize.height * 0.2,
            ),
            LoginTitle(),
            SizedBox(
              height: deviceSize.height * 0.075,
            ),
            LoginIllustration(),
            SizedBox(
              height: deviceSize.height * 0.1,
            ),
            LoginButton(),
            SizedBox(
              height: deviceSize.height * 0.025,
            ),
            LoginCaption()
          ],
        ),
      ),
    );
  }
}
