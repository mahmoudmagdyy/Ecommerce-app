
import 'package:appwithfirebase/core/controller/viewcontrol.dart';
import 'package:appwithfirebase/core/service/firestoreUser.dart';
import 'package:appwithfirebase/helper/locatStorageData.dart';
import 'package:appwithfirebase/model/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthControler extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseAuth _auth = FirebaseAuth.instance;
  final LocalStorageData localStorageData =Get.find();

  late final String email, password, name;

  Rxn<User> _user = Rxn<User>();

  get user => _user.value?.email;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
    if(_auth.currentUser!=null){
      getCurrentUserData(_auth.currentUser!.uid);
    }
  }

  void googleSignIn() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    print(googleUser);
    GoogleSignInAuthentication googleSignInAuthentication =
    await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    await _auth.signInWithCredential(credential).then((user) {
      saveUser(user);
      Get.offAll(ViewControl());
    });
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password)
          .then((value)async{

        getCurrentUserData(value.user!.uid);

      });

      Get.offAll(ViewControl());
    } catch (e) {
      print(e);
      Get.snackbar("Error login account", 'error',
          colorText: Colors.indigo, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signUpWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        saveUser(user);
      });

      Get.offAll(ViewControl());
    } catch (e) {
      print(e);
      Get.snackbar(
        'Error login account',
        'error',
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveUser(UserCredential user) async {

    UserModel userModel =UserModel(
      userId: user.user?.uid,
      email: user.user?.email,
      name: name == null ? user.user?.displayName : name,
      pic: '',
    );
    await FireStoreUser().addUserToFireStore(userModel);
    setUser(userModel);
  }

  void getCurrentUserData (String uid)async{
    await FireStoreUser().getCurrentUser(uid).then((value){
      setUser(UserModel.fromJson(value.data() as Map));
    });
  }

  void setUser(UserModel userModel) async {
  await localStorageData.setUser(userModel);
  }
}
