import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_movie_diary/models/user_model.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum isLogin {
  login,
  logout,
}

class AuthController extends GetxController {
  late UserCredential userCredential;
  var user = UserModel().obs;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void onReady() {
    authCheck();
    super.onReady();
  }

  Future<isLogin> signIn() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      return isLogin.logout;
    } else {
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Return the UserCredential
      userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      user.value = UserModel(
          id: userCredential.user!.uid.toString(),
          name: userCredential.user!.displayName.toString(),
          email: userCredential.user!.email.toString());

      return isLogin.login;
    }
  }

  signOut() async {
    await firebaseAuth.signOut();
  }

  authCheck() {
    if (firebaseAuth.currentUser == null) {
      Future.delayed(Duration(seconds: 2))
          .then((value) => Get.offAndToNamed("/login"));
    } else {
      Future.delayed(Duration(seconds: 2)).then((value) {
        user.value = UserModel(
            id: firebaseAuth.currentUser!.uid.toString(),
            name: firebaseAuth.currentUser!.displayName.toString(),
            email: firebaseAuth.currentUser!.email.toString());
        Get.offAndToNamed("/home");
      });
    }
  }
}
