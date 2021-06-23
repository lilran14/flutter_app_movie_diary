import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_movie_diary/controllers/home_controller.dart';
import 'package:flutter_app_movie_diary/core/theme/theme_config.dart';
import 'package:flutter_app_movie_diary/pages/main/components/bottom_nav.dart';
import 'package:flutter_app_movie_diary/pages/main/pages/history/history_page.dart';
import 'package:flutter_app_movie_diary/pages/main/pages/home/home_page.dart';
import 'package:flutter_app_movie_diary/pages/main/pages/watchlist/watchlist_page.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import 'package:flutter_app_movie_diary/core/constants/assets_url.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    List<Widget> listPage = [HomePage(), WatchlistPage(), HistoryPage()];
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColor.darkBackgroundColor,
        appBar: appBarSelector(homeController),
        body: Obx(() => PageTransitionSwitcher(
              transitionBuilder:
                  (child, primaryAnimation, secondaryAnimation) =>
                      FadeThroughTransition(
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              ),
              child: listPage[homeController.bottomNavIndex.value],
            )),
        bottomNavigationBar: BottomNavHomeMain(homeController: homeController),
      ),
    );
  }

  // App Bar Selector
  AppBar appBarSelector(HomeController homeController) {
    // Appbar Name
    List<String> appBarName = ["Movie Diary", "Watchlist", "History"];
    // Leading Widget
    List<Widget> leadingAppBar = [
      Padding(
        padding: EdgeInsets.all(15),
        child: SvgPicture.asset(
          AssetsURL.imageUrl + "app_logo.svg",
          fit: BoxFit.cover,
        ),
      ),
      Icon(
        LineIcons.gratipayGittip,
        size: 24,
      ),
      Icon(
        LineIcons.history,
        size: 24,
      )
    ];
    return AppBar(
      elevation: 0,
      leading: Obx(() => homeController.bottomNavIndex.value == 0
          ? leadingAppBar[0]
          : homeController.bottomNavIndex.value == 1
              ? leadingAppBar[1]
              : leadingAppBar[2]),
      titleSpacing: 0,
      title: Obx(() => homeController.bottomNavIndex.value == 0
          ? Text(
              appBarName[0],
            )
          : homeController.bottomNavIndex.value == 1
              ? Text(
                  appBarName[1],
                )
              : Text(
                  appBarName[2],
                )),
      actions: [
        Obx(() => homeController.bottomNavIndex.value == 0
            ? InkWell(
                onTap: () => Get.toNamed("/profile"),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Icon(
                    LineIcons.user,
                    size: 24,
                  ),
                ),
              )
            : SizedBox())
      ],
    );
  }
}
