import 'package:flutter/material.dart';

class CustomTextFieldModel {
  final String hintText;
  final String labelText;

  final Function(String) onChanged;
  final FormFieldValidator validator;

  final bool obscureText;

  CustomTextFieldModel(
      {required this.hintText,
      required this.labelText,
      required this.onChanged,
      required this.validator,
      this.obscureText = false});
}
