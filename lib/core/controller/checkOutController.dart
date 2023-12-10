
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../helper/enum.dart';

class CheckOutController extends GetxController{

int get currentStep =>_currentStep ;
int _currentStep =0;

Delivery get delivery =>_delivery;

Delivery _delivery = Delivery.StandardDelivery;



late String  street1 ,street2 ,city ,state ,country ;

GlobalKey<FormState> formState =GlobalKey();


continueStep() {

  if (_currentStep == 0) {
    _currentStep = _currentStep + 1;

  }else if (_currentStep ==1) {
    formState.currentState!.save();
    if(formState.currentState!.validate()){
      _currentStep = _currentStep + 1;
    }
  }else if(_currentStep ==2){
   // Get.to(ViewControl());
  }

  update();

}

cancelStep() {
  if (_currentStep > 0) {

      _currentStep = _currentStep - 1; //currentStep-=1;
      update();
  }
}

onStepTapped(int value) {

  _currentStep = value;
  update();
}



}