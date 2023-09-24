import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultFormField(

        {required TextEditingController controller,
        required String label,
        required Function validate,
          IconButton ?suffixIcon,
          Icon ?prefixIcon,
        bool isPassword = false}) =>
    TextFormField(
      controller: controller,
      validator: (value) {
        validate(value);
      },
      obscureText: isPassword,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: label,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(12))),
    );
