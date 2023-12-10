import 'package:appwithfirebase/constance.dart';
import 'package:appwithfirebase/view/components/customText.dart';
import 'package:flutter/material.dart';



class CustomButton extends StatelessWidget {
  final String text;

  final Color color;

  final Function() ?onPress;

   CustomButton({
     this.onPress,
    this.text = 'Write text ',
    this.color = primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius:BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.all(10),
      onPressed: onPress,
      color: primaryColor,
      child: CustomText(
        alignment: Alignment.center,
        text: text,
        color: Colors.white,
      ),
    );
  }
}
