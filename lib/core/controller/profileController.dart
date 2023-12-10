import 'package:appwithfirebase/helper/locatStorageData.dart';
import 'package:appwithfirebase/model/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileController extends GetxController {

ValueNotifier<bool> get loading=>_loading;
ValueNotifier<bool> _loading =ValueNotifier(false);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrentUser();
  }

  final LocalStorageData localStorageData = Get.find();

  UserModel get userModel => _userModel;
  late UserModel _userModel;

  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
  }

  void getCurrentUser() async {
    _loading.value=true;
    await localStorageData.getUser.then((value) {
      _userModel = value!;
    });
    _loading.value=false;
    update();
  }
}
