import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  var hintText;
  var controller;
  var obsecuretext;
   CustomTextField({super.key, required this.hintText, this.controller, this.obsecuretext = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecuretext,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(width: 1,color:Colors.grey )
        ),
        
      ),
    );
  }
}
