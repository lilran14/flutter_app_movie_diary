import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryModel {
  final String title;
  final String imageUrl;
  final Timestamp createdDate;
  HistoryModel({
    required this.title,
    required this.imageUrl,
    required this.createdDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'imageUrl': imageUrl,
      'createdDate': createdDate,
    };
  }
}
