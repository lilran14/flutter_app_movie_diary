import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_movie_diary/controllers/auth_controller.dart';
import 'package:flutter_app_movie_diary/core/services/firestore_database.dart';
import 'package:flutter_app_movie_diary/core/services/movie_service.dart';
import 'package:flutter_app_movie_diary/core/theme/theme_config.dart';
import 'package:flutter_app_movie_diary/core/widgets/block_button.dart';
import 'package:flutter_app_movie_diary/core/widgets/outline_block_button.dart';
import 'package:flutter_app_movie_diary/models/movie_model.dart';
import 'package:flutter_app_movie_diary/models/watchlist_model.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    FireStoreDB fireStoreDB = FireStoreDB();
    MovieModel movieData = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        leading:
            InkWell(onTap: () => Get.back(), child: Icon(LineIcons.arrowLeft)),
        centerTitle: true,
        elevation: 0,
        title: Text("Movie Details"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.only(bottom: Gap.defaultMargin),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: Gap.defaultPadding,
              ),
              Center(
                child: Container(
                  width: 183,
                  height: 250,
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Image.network(
                    MovieService.imageUrlW400 + movieData.posterPath,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              SizedBox(
                height: Gap.defaultPadding,
              ),
              Text(movieData.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontWeight: FontWeight.bold)),
              SizedBox(
                height: Gap.defaultGap / 2,
              ),
              Text(movieData.title,
                  softWrap: false,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: ThemeColor.darkTextVariantColor,
                      fontWeight: FontWeight.w300)),
              SizedBox(
                height: Gap.defaultGap / 2,
              ),
              Container(
                height: 50,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Chip(
                        label: Text(MovieModel.getGenreName(
                            movieData.listGenre![index]))),
                    separatorBuilder: (context, index) => SizedBox(
                          width: Gap.defaultGap,
                        ),
                    itemCount: movieData.listGenre!.length),
              ),
              SizedBox(
                height: Gap.defaultPadding,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Gap.defaultPadding),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Description",
                  softWrap: false,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: Gap.defaultGap,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Gap.defaultPadding),
                alignment: Alignment.centerLeft,
                child: Text(
                  movieData.overview,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontWeight: FontWeight.w300),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(Gap.defaultPadding),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlineBlockButton(
                        textButton: "Add to Watchlist",
                        onPressed: () {
                          fireStoreDB.addWatchlist(
                              authController.user.value.id!, movieData);
                        },
                      ),
                    ),
                    SizedBox(
                      width: Gap.defaultPadding,
                    ),
                    Expanded(
                      child: BlockButton(
                        textButton: "Add to Already Watched",
                        onPressed: () {
                          fireStoreDB.addHistory(
                              authController.user.value.id!,
                              WatchlistModel(
                                  movieId: movieData.id,
                                  title: movieData.title,
                                  score: movieData.voteAverage,
                                  imageUrl: movieData.posterPath,
                                  createdDate: Timestamp.now()));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
