import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_movie_diary/models/history_model.dart';
import 'package:flutter_app_movie_diary/models/movie_model.dart';
import 'package:flutter_app_movie_diary/models/watchlist_model.dart';

class FireStoreDB {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //== Watchlist ==
  // add watchlist
  Future<void> addWatchlist(String uid, MovieModel movieData) async {
    try {
      await _firestore.collection("users").doc(uid).collection("watchList").add(
          WatchlistModel(
                  movieId: movieData.id,
                  title: movieData.title,
                  score: movieData.voteAverage,
                  imageUrl: movieData.posterPath,
                  createdDate: Timestamp.now())
              .toMap());
    } catch (e) {
      throw (e);
    }
  }

  // delete watchlist
  Future<void> deleteWachlist(String uid, String watchId) async {
    try {
      await _firestore
          .collection("users")
          .doc(uid)
          .collection("watchList")
          .doc(watchId)
          .delete();
    } catch (e) {
      throw (e);
    }
  }

  // delete watchlist
  Future<void> updateWathlist(String uid, String watchId) async {
    try {
      await _firestore
          .collection("users")
          .doc(uid)
          .collection("watchList")
          .doc(watchId)
          .update({"watched": true});
    } catch (e) {
      throw (e);
    }
  }

  // stream watchlist
  Stream<List<WatchlistModel>> getWatchlist(String uid) {
    return _firestore
        .collection("users")
        .doc(uid)
        .collection("watchList")
        .where("watched", isEqualTo: false)
        .snapshots()
        .map((query) {
      List<WatchlistModel> watchlist = [];
      query.docs.forEach((element) {
        watchlist.add(WatchlistModel(
            id: element.id,
            movieId: element.get("movieId"),
            title: element.get("title"),
            score: element.get("score"),
            imageUrl: element.get("imageUrl"),
            createdDate: element.get("createdDate")));
      });
      return watchlist;
    });
  }

  //== History ==
  //add history
  Future<void> addHistory(String uid, WatchlistModel watchlistData) async {
    try {
      await _firestore.collection("users").doc(uid).collection("history").add(
          HistoryModel(
                  title: watchlistData.title,
                  imageUrl: watchlistData.imageUrl,
                  createdDate: Timestamp.now())
              .toMap());
    } catch (e) {
      throw (e);
    }
  }

  //stream history
  Stream<List<HistoryModel>> getHistory(String uid) {
    return _firestore
        .collection("users")
        .doc(uid)
        .collection("history")
        .snapshots()
        .map((query) {
      List<HistoryModel> history = [];
      query.docs.forEach((element) {
        history.add(HistoryModel(
            title: element.get("title"),
            imageUrl: element.get("imageUrl"),
            createdDate: element.get("createdDate")));
      });
      return history;
    });
  }
}
