import 'package:flutter/material.dart';

import '../constants/appConstants.dart';

void SnackBarMessage(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: kPrimaryColor,
      content: Text(message),
    ),
  );
}
