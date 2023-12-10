
import 'package:appwithfirebase/core/controller/checkOutController.dart';
import 'package:appwithfirebase/helper/locatStorageData.dart';
import 'package:get/get.dart';
import '../core/controller/authController.dart';
import '../core/controller/bottomNaveBarController.dart';
import '../core/controller/cartController.dart';
import '../core/controller/homePageViewController.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
Get.lazyPut(() => AuthControler());
Get.lazyPut(() => BottomNaveBarController());
Get.lazyPut(() => HomePageController());
Get.lazyPut(() => CartViewController());
Get.lazyPut(() => LocalStorageData());
Get.lazyPut(() => CheckOutController());
  }

}