import 'package:flutter/material.dart';
import 'components/body.dart';
import 'package:tenshield/components/no_account_text.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 91, 94, 94),
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
      body: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              begin: Alignment.bottomCenter,
              //stops: [0.7, 0.7],
              end: Alignment.topCenter,
              colors: [
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 91, 94, 94),
              ],
            ),
          ),
          child: Body()),
      bottomNavigationBar: BottomAppBar(
        child: NoAccountText(),
      ),
    );
  }
}
