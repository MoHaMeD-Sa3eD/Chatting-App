import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String name;

  final void Function() onPressed;

  const CustomElevatedButton({
    super.key,
    required this.name,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
      ),
      child: Text(name),
    );
  }
}
