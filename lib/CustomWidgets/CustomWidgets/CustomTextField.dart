import 'package:flutter/material.dart';

import '../CustomWidgetsModels/CustomTextFieldModel.dart';

class CustomTextFormField extends StatelessWidget {
  final CustomTextFieldModel customTextFieldModel;

  const CustomTextFormField({super.key, required this.customTextFieldModel});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: customTextFieldModel.obscureText,
      validator: customTextFieldModel.validator,
      onChanged: customTextFieldModel.onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.white),
        ),
        hintText: customTextFieldModel.hintText,
        hintStyle: const TextStyle(color: Colors.white),
        labelText: customTextFieldModel.labelText,
        labelStyle: const TextStyle(color: Colors.white),
      ),
    );
  }
}
