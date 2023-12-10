import 'package:appwithfirebase/constance.dart';
import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String hinttext ;
 final dynamic onSaved;
  final dynamic validator;
  final bool obscureText;

  const CustomTextForm({super.key, required this.hinttext, this.onSaved, this.validator, required this.obscureText });

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      obscureText: obscureText,
      onSaved: onSaved,
      validator: validator,
      decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: Colors.white)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color:primaryColor))),
    );
  }
}
