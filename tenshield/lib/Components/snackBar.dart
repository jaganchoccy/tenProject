import 'package:flutter/material.dart';

loadSnackBar(BuildContext context, text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: Duration(seconds: 5),
    content: Text(
      text,
      textAlign: TextAlign.center,
    ),
  ));
}
