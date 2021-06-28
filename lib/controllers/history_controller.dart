import 'package:flutter_app_movie_diary/controllers/auth_controller.dart';
import 'package:flutter_app_movie_diary/core/services/firestore_database.dart';
import 'package:flutter_app_movie_diary/models/history_model.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  final history = RxList<HistoryModel>();
  @override
  void onInit() {
    String uid = Get.find<AuthController>().user.value.id!;
    history.bindStream(FireStoreDB().getHistory(uid));
    super.onInit();
  }
}
