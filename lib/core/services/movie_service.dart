import 'dart:io';

import 'package:flutter_app_movie_diary/core/utilities/http_error_handling.dart';
import 'package:flutter_app_movie_diary/models/movie_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class MovieService {
  static String key = "?api_key=64a414cda94ba2e60873f472077c59b1";
  static String baseUrl = "https://api.themoviedb.org/3";
  static String imageUrl = "https://image.tmdb.org/t/p/original";
  static String imageUrlW400 = "https://image.tmdb.org/t/p/w400";
  static String imageUrlW200 = "https://image.tmdb.org/t/p/w200";

  // API
  static String popularApi = "/movie/popular";
  static String upComingApi = "/movie/upcoming";
  static String nowPlayingApi = "/movie/now_playing";
  static String topRatedApi = "/movie/top_rated";
  static String movieDetail = "/movie/";

  // Get Popular Movie
  Future<List<MovieModel>> getPopular() async {
    var url = Uri.parse(baseUrl + popularApi + key);
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var decodeResponse = convert.jsonDecode(response.body);
        List listData = decodeResponse["results"];
        List<MovieModel> listMovie = [];
        listData.forEach((data) {
          listMovie.add(MovieModel.fromJson(data));
        });
        return listMovie;
      } else {
        throw (HttpErrorHandle().statusCodeError(response.statusCode));
      }
    } on SocketException {
      throw ("No Connection!");
    } on HttpException {
      throw ("Couldn't find the post!");
    } on FormatException {
      throw FormatException("Bad response format!");
    } catch (e) {
      throw ("Unknown Error");
    }
  }

  // Get UpComing Movie
  Future<List<MovieModel>> getUpComing() async {
    var url = Uri.parse(baseUrl + upComingApi + key);
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var decodeResponse = convert.jsonDecode(response.body);
        List listData = decodeResponse["results"];
        List<MovieModel> listMovie = [];
        listData.forEach((data) {
          listMovie.add(MovieModel.fromJson(data));
        });
        return listMovie;
      } else {
        throw (HttpErrorHandle().statusCodeError(response.statusCode));
      }
    } on SocketException {
      throw ("No Connection!");
    } on HttpException {
      throw ("Couldn't find the post!");
    } on FormatException {
      throw FormatException("Bad response format!");
    } catch (e) {
      throw ("Unknown Error");
    }
  }

  // Get Now Playing Movie
  Future<List<MovieModel>> getNowPlaying() async {
    var url = Uri.parse(baseUrl + nowPlayingApi + key);
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var decodeResponse = convert.jsonDecode(response.body);
        List listData = decodeResponse["results"];
        List<MovieModel> listMovie = [];
        listData.forEach((data) {
          listMovie.add(MovieModel.fromJson(data));
        });
        return listMovie;
      } else {
        throw (HttpErrorHandle().statusCodeError(response.statusCode));
      }
    } on SocketException {
      throw ("No Connection!");
    } on HttpException {
      throw ("Couldn't find the post!");
    } on FormatException {
      throw FormatException("Bad response format!");
    } catch (e) {
      throw ("Unknown Error");
    }
  }

  // Get Top Voted Movie
  Future<List<MovieModel>> getTopRated() async {
    var url = Uri.parse(baseUrl + topRatedApi + key);
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var decodeResponse = convert.jsonDecode(response.body);
        List listData = decodeResponse["results"];
        List<MovieModel> listMovie = [];
        listData.forEach((data) {
          listMovie.add(MovieModel.fromJson(data));
        });
        return listMovie;
      } else {
        throw (HttpErrorHandle().statusCodeError(response.statusCode));
      }
    } on SocketException {
      throw ("No Connection!");
    } on HttpException {
      throw ("Couldn't find the post!");
    } on FormatException {
      throw FormatException("Bad response format!");
    } catch (e) {
      throw ("Unknown Error");
    }
  }

  // Get Movie By Id
  Future<MovieModel> getMovieId(int id) async {
    var url = Uri.parse(baseUrl + movieDetail + id.toString() + key);
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var decodeResponse = convert.jsonDecode(response.body);
        MovieModel movieData = MovieModel.fromJson(decodeResponse);
        return movieData;
      } else {
        throw (HttpErrorHandle().statusCodeError(response.statusCode));
      }
    } on SocketException {
      throw ("No Connection!");
    } on HttpException {
      throw ("Couldn't find the post!");
    } on FormatException {
      throw FormatException("Bad response format!");
    } catch (e) {
      throw ("Unknown Error");
    }
  }
}
