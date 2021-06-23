import 'package:flutter/material.dart';
import 'package:flutter_app_movie_diary/core/theme/theme_config.dart';
import 'package:flutter_app_movie_diary/pages/main/pages/home/components/movie_list.dart';
import 'package:flutter_app_movie_diary/pages/main/pages/home/components/section_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            MovieList(),
            SectionTitle(
              title: "Up Coming",
              onPressed: () {},
            ),
            MovieList(),
            SectionTitle(
              title: "Popular",
              onPressed: () {},
            ),
            MovieList(),
            SectionTitle(
              title: "Top Rated",
              onPressed: () {},
            ),
            MovieList()
          ],
        ),
      ),
    );
  }
}
