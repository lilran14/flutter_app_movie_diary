import 'package:flutter_app_movie_diary/controllers/auth_controller.dart';
import 'package:flutter_app_movie_diary/core/services/firestore_database.dart';
import 'package:flutter_app_movie_diary/models/watchlist_model.dart';
import 'package:get/get.dart';

class WatchlistController extends GetxController {
  final watchList = RxList<WatchlistModel>();
  @override
  void onInit() {
    String uid = Get.find<AuthController>().user.value.id!;
    watchList.bindStream(FireStoreDB().getWatchlist(uid));
    super.onInit();
  }
}
