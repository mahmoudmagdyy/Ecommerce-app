import 'package:appwithfirebase/view/cart_view.dart';
import 'package:appwithfirebase/view/homepage.dart';
import 'package:appwithfirebase/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BottomNaveBarController extends GetxController {
  int _navigatorValue = 0;
  Widget _currentScreen=Homepage();

  get navigatorValue =>_navigatorValue;
  get currentScreen =>_currentScreen;
  void changedSelecyedValue(int selectValue) {
    _navigatorValue = selectValue;
    switch(selectValue){
      case 0 :{
        _currentScreen=Homepage();
        break;
      }
      case 1:{
        _currentScreen=CartView();
        break;
      }
      case 2:{
        _currentScreen=ProfileView();
        break;
      }
    }
    update();
  }
}
