import 'package:flutter_app_movie_diary/core/binding/app_binding.dart';
import 'package:flutter_app_movie_diary/pages/login/login_page.dart';
import 'package:flutter_app_movie_diary/pages/main/main_page.dart';
import 'package:flutter_app_movie_diary/pages/movie/movie_page.dart';
import 'package:flutter_app_movie_diary/pages/profile/profile_page.dart';
import 'package:flutter_app_movie_diary/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class AppRoute {
  static List<GetPage> pages = [
    GetPage(
        name: "/splash", page: () => SplashPage(), binding: SplashBinding()),
    GetPage(
      name: "/login",
      page: () => LoginPage(),
    ),
    GetPage(name: "/home", page: () => MainPage(), binding: MainPageBinding()),
    GetPage(name: "/profile", page: () => ProfilePage()),
    GetPage(name: "/movie", page: () => MoviePage()),
  ];
}
