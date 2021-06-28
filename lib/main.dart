import 'package:flutter/material.dart';
import 'package:flutter_app_movie_diary/core/routes/app_route.dart';
import 'package:flutter_app_movie_diary/core/services/firebase.dart';
import 'package:flutter_app_movie_diary/core/theme/app_theme.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Diary',
      getPages: AppRoute.pages,
      theme: AppTheme.darkTheme,
      initialRoute: '/splash',
    );
  }
}
