
import 'package:appwithfirebase/core/controller/authController.dart';
import 'package:appwithfirebase/view/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'bottomNaveBarController.dart';

class ViewControl extends GetView<AuthControler> {


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthControler>().user == null) ? Login() :
      GetBuilder<BottomNaveBarController>(
        init: Get.put(BottomNaveBarController()),
        builder: (controller)=>
        Scaffold(

            body: controller.currentScreen,
          bottomNavigationBar: bottomNavigationBar(),
        ),
      );
    });
  }
  Widget bottomNavigationBar() {
    return GetBuilder<BottomNaveBarController>(
      init: Get.find(),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            activeIcon: const Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Text("Explore"),
            ),
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                "assets/images/Icon_Explore.png",
                fit: BoxFit.contain,
                width: 20,
              ),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: const Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Text("Cart"),
            ),
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                "assets/images/Icon_Cart.png",
                fit: BoxFit.contain,
                width: 20,
              ),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: const Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Text("User"),
            ),
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                "assets/images/Icon_User.png",
                fit: BoxFit.contain,
                width: 20,
              ),
            ),
          ),
        ],
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changedSelecyedValue(index);

        },
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade50,
      ),
    );
  }
}
