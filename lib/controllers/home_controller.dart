import 'package:get/get.dart';

class HomeController extends GetxController {
  var bottomNavIndex = 0.obs;

  void changeBottomNavIndex(int newIndex) {
    bottomNavIndex.value = newIndex;
  }
}
