
import 'package:appwithfirebase/core/controller/authController.dart';
import 'package:appwithfirebase/constance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/custombuttonauth.dart';
import '../components/customlogoauth.dart';
import '../components/textformfield.dart';


class Login extends GetWidget<AuthControler> {
   Login({super.key});

   AuthControler controler =AuthControler();

  GlobalKey<FormState> _key =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
          Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 50),
                const CustomLogoAuth(),
                Container(height: 20),
                const Text("Welcom",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                Container(height: 10),
                const Text("Login To Continue Using The App",
                    style: TextStyle(color: Colors.grey)),
                Container(height: 20),
                const Text(
                  "Email",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Container(height: 10),
                CustomTextForm(
                  obscureText: false,
                  onSaved: (value){
                    controler.email=value;
                  },
                  validator: (value){
                   if(value==null){
                     print("error");
                   }
                  },
                    hinttext: "ُEnter Your Email",
                    ),
                Container(height: 10),
                const Text(
                  "Password",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Container(height: 10),
                CustomTextForm(
                  obscureText: true,
                  onSaved: (value){
                    controler.password=value;
                  },
                  validator: (value){
                    if(value==null){
                      print("error");
                    }
                  },
                    hinttext: "ُEnter Your Password", ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                  alignment: Alignment.topRight,
                  child: const Text(
                    "Forgot Password ?",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomButtonAuth(title: "login", onPressed: () {
            _key.currentState?.save();
            if(_key.currentState!.validate()){
             controler.signInWithEmailAndPassword();
            }

          }),
          const SizedBox(height: 20),

          MaterialButton(
              height: 50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white,
              textColor: Colors.black,
              onPressed: () async {
                controller.googleSignIn();

              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Login With Google  "),
                  Image.asset(
                    "assets/images/4.png",
                    width: 20,
                  )
                ],
              )),
          Container(height: 20),
          // Text("Don't Have An Account ? Resister" , textAlign: TextAlign.center,)
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed("signup") ;
            },
            child: const Center(
              child: Text.rich(TextSpan(children: [
                TextSpan(
                  text: "Don't Have An Account ? ",
                ),
                TextSpan(
                    text: "Register",
                    style: TextStyle(
                        color: primaryColor, fontWeight: FontWeight.bold)),
              ])),
            ),
          )
        ]),
      ),
    );
  }
}
