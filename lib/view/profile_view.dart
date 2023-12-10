
import 'package:appwithfirebase/core/controller/profileController.dart';
import 'package:appwithfirebase/view/auth/login.dart';
import 'package:appwithfirebase/view/components/customText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) => controller.loading.value?Center(child: CircularProgressIndicator()):Scaffold(
          body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          image: DecorationImage(
                              image:  (controller.userModel == null) ? AssetImage("assets/images/logoApp.png")
                                  : (controller.userModel.pic == 'default')
                                  ? AssetImage("assets/images/Avatar.png") :  AssetImage("assets/images/logoApp.png"),
                              fit: BoxFit.fill)),
                    ),


                    Column(
                      children: [
                        CustomText(text: controller.userModel.name.toString(),fontSize: 28,color: Colors.black,),
                        SizedBox(height: 8,),
                        CustomText(text: controller.userModel.email.toString(),fontSize: 18,color: Colors.black,),
                      ],
                    )
                  ],
                ),
              ),

              SizedBox(height: 75),
              Container(
                child: TextButton(

                  onPressed: (){},
                  child: ListTile(
                    title: CustomText(
                      text: 'Edit Profile',
                    ),
                    leading: Image.asset("assets/images/Icon_Edit-Profile.png"),
                    trailing: Icon(Icons.navigate_next_outlined,color: Colors.black,),
                  ),

                ),
              ),SizedBox(height: 10,),
              Container(
                child: TextButton(

                  onPressed: (){},
                  child: ListTile(
                    title: CustomText(
                      text: 'Shipping Address',
                    ),
                    leading: Image.asset("assets/images/Icon_Location.png"),
                    trailing: Icon(Icons.navigate_next_outlined,color: Colors.black,),
                  ),

                ),
              ),SizedBox(height: 10,),
              Container(
                child: TextButton(

                  onPressed: (){},
                  child: ListTile(
                    title: CustomText(
                      text: 'Order History',
                    ),
                    leading: Image.asset("assets/images/Icon_History.png"),
                    trailing: Icon(Icons.navigate_next_outlined,color: Colors.black,),
                  ),

                ),
              ),SizedBox(height: 10,),
              Container(
                child: TextButton(

                  onPressed: (){},
                  child: ListTile(
                    title: CustomText(
                      text: 'Cards',
                    ),
                    leading: Image.asset("assets/images/Icon_Payment.png"),
                    trailing: Icon(Icons.navigate_next_outlined,color: Colors.black,),
                  ),

                ),
              ),SizedBox(height: 10,),
              Container(
                child: TextButton(

                  onPressed: (){},
                  child: ListTile(
                    title: CustomText(
                      text: 'Notifications',
                    ),
                    leading: Image.asset("assets/images/Icon_Alert.png"),
                    trailing: Icon(Icons.navigate_next_outlined,color: Colors.black,),
                  ),

                ),
              ),SizedBox(height: 10,),
              Container(
                child: TextButton(

                  onPressed: (){
                    controller.signOut();
                    Get.offAll(Login());
                  },
                  child: ListTile(
                    title: CustomText(
                      text: 'Log Out',
                    ),
                    leading: Image.asset("assets/images/Icon_Exit.png"),
                    trailing: Icon(Icons.navigate_next_outlined,color: Colors.black,),
                  ),

                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
