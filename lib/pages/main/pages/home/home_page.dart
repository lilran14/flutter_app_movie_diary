import 'package:flutter/material.dart';
import 'package:flutter_app_movie_diary/controllers/list_movie_controller.dart';
import 'package:flutter_app_movie_diary/core/theme/theme_config.dart';
import 'package:flutter_app_movie_diary/pages/main/pages/home/components/movie_list.dart';
import 'package:flutter_app_movie_diary/pages/main/pages/home/components/section_title.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ListMovieController popularMovie = Get.find(tag: "Popular");
    ListMovieController nowMovie = Get.find(tag: "NowPlaying");
    ListMovieController topMovie = Get.find(tag: "TopRated");
    ListMovieController upMovie = Get.find(tag: "UpComing");
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        margin: EdgeInsets.only(bottom: Gap.defaultMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(
              title: "Now Playing",
              onPressed: () {},
            ),
            Obx(() {
              if (nowMovie.isLoading.value == true) {
                return MovieList(
                  listMovie: [],
                );
              } else if (nowMovie.isLoading.value == false &&
                  nowMovie.isError.value == true) {
                return SizedBox();
              } else {
                return MovieList(
                  listMovie: nowMovie.listMovie,
                );
              }
            }),
            SectionTitle(
              title: "Up Coming",
              onPressed: () {},
            ),
            Obx(() {
              if (upMovie.isLoading.value == true) {
                return MovieList(
                  listMovie: [],
                );
              } else if (upMovie.isLoading.value == false &&
                  upMovie.isError.value == true) {
                return SizedBox();
              } else {
                return MovieList(
                  listMovie: upMovie.listMovie,
                );
              }
            }),
            SectionTitle(
              title: "Popular",
              onPressed: () {},
            ),
            Obx(() {
              if (popularMovie.isLoading.value == true) {
                return MovieList(
                  listMovie: [],
                );
              } else if (popularMovie.isLoading.value == false &&
                  popularMovie.isError.value == true) {
                return SizedBox();
              } else {
                return MovieList(
                  listMovie: popularMovie.listMovie,
                );
              }
            }),
            SectionTitle(
              title: "Top Rated",
              onPressed: () {},
            ),
            Obx(() {
              if (topMovie.isLoading.value == true) {
                return MovieList(
                  listMovie: [],
                );
              } else if (topMovie.isLoading.value == false &&
                  topMovie.isError.value == true) {
                return SizedBox();
              } else {
                return MovieList(
                  listMovie: topMovie.listMovie,
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
