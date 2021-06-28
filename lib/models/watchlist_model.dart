import 'package:cloud_firestore/cloud_firestore.dart';

class WatchlistModel {
  final String? id;
  final int movieId;
  final String title;
  final double score;
  final String imageUrl;
  final Timestamp createdDate;
  final bool? watched;
  WatchlistModel({
    this.id,
    required this.movieId,
    required this.title,
    required this.score,
    required this.imageUrl,
    required this.createdDate,
    this.watched = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'movieId': movieId,
      'title': title,
      'score': score,
      'imageUrl': imageUrl,
      'createdDate': createdDate,
      'watched': watched,
    };
  }
}
