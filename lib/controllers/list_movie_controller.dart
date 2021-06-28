import 'package:get/get.dart';

import 'package:flutter_app_movie_diary/core/services/movie_service.dart';
import 'package:flutter_app_movie_diary/models/movie_model.dart';

enum ListType {
  popular,
  upcoming,
  toprated,
  nowplaying,
}

class ListMovieController extends GetxController {
  ListMovieController({
    required this.listType,
  });
  final ListType listType;
  late List<MovieModel> listMovie;
  RxBool isLoading = true.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;

  @override
  void onInit() {
    super.onInit();
    if (listType == ListType.popular) {
      getPopularMovie();
    }
    if (listType == ListType.upcoming) {
      getUpComingMovie();
    }
    if (listType == ListType.toprated) {
      getTopRatedMovie();
    }
    if (listType == ListType.nowplaying) {
      getNowPlayingMovie();
    }
  }

  void getPopularMovie() async {
    isLoading.value = true;
    isError.value = false;
    try {
      listMovie = await MovieService().getPopular();
      isLoaded.value = true;
      isLoading.value = false;
    } catch (e) {
      Get.snackbar("Error", e.toString());
      isError.value = true;
      isLoading.value = false;
    }
  }

  void getNowPlayingMovie() async {
    isLoading.value = true;
    isError.value = false;
    try {
      listMovie = await MovieService().getNowPlaying();
      isLoaded.value = true;
      isLoading.value = false;
    } catch (e) {
      Get.snackbar("Error", e.toString());
      isError.value = true;
      isLoading.value = false;
    }
  }

  void getTopRatedMovie() async {
    isLoading.value = true;
    isError.value = false;
    try {
      listMovie = await MovieService().getTopRated();
      isLoaded.value = true;
      isLoading.value = false;
    } catch (e) {
      Get.snackbar("Error", e.toString());
      isError.value = true;
      isLoading.value = false;
    }
  }

  void getUpComingMovie() async {
    isLoading.value = true;
    isError.value = false;
    try {
      listMovie = await MovieService().getUpComing();
      isLoaded.value = true;
      isLoading.value = false;
    } catch (e) {
      Get.snackbar("Error", e.toString());
      isError.value = true;
      isLoading.value = false;
    }
  }
}
