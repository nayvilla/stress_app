import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

Widget customTextField(String labelText, String hintText, int maxLength, {bool obscureText = false, double customWidth = double.infinity, TextEditingController? controller, ValueChanged<String>? onChanged,}) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Container(
      width: customWidth,
      constraints: const BoxConstraints(
        maxWidth: double.infinity,
      ),
      child: TextField(
        controller: controller,
        maxLength: maxLength,
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          //labelStyle: const TextStyle(color: Color.fromARGB(255, 245, 242, 242)),
          hintText: hintText,
          //hintStyle: const TextStyle(color: Color.fromARGB(255, 196, 189, 196)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Color(0xFFde455f)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Color(0xFFde455f)),
          ),
          //contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        ),
        //style: const TextStyle(color: Color.fromARGB(255, 196, 189, 196)), 
      ),
    ),
  );
}