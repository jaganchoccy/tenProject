import 'package:flutter/material.dart';
import 'components/body.dart';
import 'package:tenshield/components/no_account_text.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "forgot password",
          style: TextStyle(
            fontFamily: "RobotoLight",
            color: Colors.black,
            fontWeight: FontWeight.w100,
            fontSize: 16,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Body(),
      bottomNavigationBar: BottomAppBar(
        child: NoAccountText(),
      ),
    );
  }
}
