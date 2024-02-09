import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String name;
  final Function() onPressed;

  const CustomTextButton({
    super.key,
    required this.name,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(name),
    );
  }
}
