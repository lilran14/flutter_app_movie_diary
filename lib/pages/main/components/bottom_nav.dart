import 'package:flutter/material.dart';
import 'package:flutter_app_movie_diary/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class BottomNavHomeMain extends StatelessWidget {
  const BottomNavHomeMain({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Obx(
        () => BottomNavigationBar(
            elevation: 0,
            currentIndex: homeController.bottomNavIndex.value,
            onTap: (value) {
              homeController.changeBottomNavIndex(value);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(LineIcons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(LineIcons.gratipayGittip), label: "Watchlist"),
              BottomNavigationBarItem(
                  icon: Icon(LineIcons.history), label: "History")
            ]),
      ),
    );
  }
}
