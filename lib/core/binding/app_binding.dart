import 'package:flutter_app_movie_diary/controllers/auth_controller.dart';
import 'package:flutter_app_movie_diary/controllers/home_controller.dart';
import 'package:flutter_app_movie_diary/controllers/list_movie_controller.dart';
import 'package:get/get.dart';

class MainPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<ListMovieController>(
      ListMovieController(listType: ListType.popular),
      tag: "Popular",
      permanent: true,
    );
    Get.put<ListMovieController>(
      ListMovieController(listType: ListType.nowplaying),
      tag: "NowPlaying",
      permanent: true,
    );
    Get.put<ListMovieController>(
      ListMovieController(listType: ListType.toprated),
      tag: "TopRated",
      permanent: true,
    );
    Get.put<ListMovieController>(
      ListMovieController(listType: ListType.upcoming),
      tag: "UpComing",
      permanent: true,
    );
  }
}

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
  }
}
