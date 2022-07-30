import 'package:flutter/material.dart';

Widget defaultFormField({
  required String? label,
  required IconData? prefixIcon,
  required TextEditingController? controller,
  required TextInputType? keyboardType,
  required FormFieldValidator<String>? validate,
  bool isPasswordViewed = true,
}) => TextFormField(
  controller : controller,
  keyboardType : keyboardType,
  obscureText : isPasswordViewed,
  validator: validate,
  decoration: InputDecoration(
    labelText : label,
    prefixIcon: Icon(prefixIcon),
  ),
);