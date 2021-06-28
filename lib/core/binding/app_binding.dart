import 'package:flutter_app_movie_diary/controllers/auth_controller.dart';
import 'package:flutter_app_movie_diary/controllers/home_controller.dart';
import 'package:get/get.dart';

class MainPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
  }
}

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
  }
}
