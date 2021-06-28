import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app_movie_diary/core/services/movie_service.dart';
import 'package:get/get.dart';

import 'package:flutter_app_movie_diary/core/theme/theme_config.dart';
import 'package:flutter_app_movie_diary/models/movie_model.dart';
import 'package:shimmer/shimmer.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    Key? key,
    required this.listMovie,
  }) : super(key: key);

  final List<MovieModel> listMovie;

  @override
  Widget build(BuildContext context) {
    if (listMovie.length == 0) {
      return Container(
        height: 120,
        width: double.infinity,
        child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: Gap.defaultPadding),
            itemBuilder: (context, index) => Shimmer(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.white12,
                      Colors.white,
                    ],
                  ),
                  child: Container(
                    width: 85,
                    height: 120,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 5,
                          right: 5,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.grey.shade400,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
            separatorBuilder: (context, index) => SizedBox(
                  width: Gap.defaultGap + 5,
                ),
            itemCount: 4),
      );
    } else {
      return Container(
        height: 120,
        width: double.infinity,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: Gap.defaultPadding),
            itemBuilder: (context, index) => MovieCard(
                  movieData: listMovie[index],
                ),
            separatorBuilder: (context, index) => SizedBox(
                  width: Gap.defaultGap + 5,
                ),
            itemCount: listMovie.length < 5 ? listMovie.length : 5),
      );
    }
  }
}

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key? key,
    required this.movieData,
  }) : super(key: key);

  final MovieModel movieData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85,
      height: 120,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () => Get.toNamed("/movie", arguments: movieData),
        child: Stack(
          children: [
            Container(
              width: 85,
              height: 120,
              child: Image.network(
                MovieService.imageUrlW200 + movieData.posterPath,
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
              bottom: 5,
              right: 5,
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Color(0xFF9BFE5E),
                child: Text(movieData.voteAverage.toStringAsFixed(1),
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: Colors.black)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
