import 'package:flutter/material.dart';
import 'package:tenshield/constant/constant.dart';
import 'package:tenshield/constant/size_config.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formErrorText(error: errors[index])),
    );
  }

  Row formErrorText({required String error}) {
    return Row(
      children: [
        Icon(
          Icons.error_outline,
          size: 16,
        ),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            error,
            style: TextStyle(
              color: XRed,
              fontStyle: FontStyle.italic,
              fontSize: 13,
              fontFamily: 'Roboto',
            ),
          ),
        ),
      ],
    );
  }
}
