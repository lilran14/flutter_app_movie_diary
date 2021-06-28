import 'package:flutter_app_movie_diary/core/services/movie_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  MovieService movieService = MovieService();
  test("Get Popular Api", () async {
    await movieService.getPopular();
  });

  test("Get UpComing Api", () async {
    await movieService.getUpComing();
  });

  test("Now Playing Api", () async {
    await movieService.getNowPlaying();
  });

  test("Top Rated Api", () async {
    await movieService.getTopRated();
  });

  test("Get Movie By Id", () async {
    await movieService.getMovieId(508943);
  });
}
