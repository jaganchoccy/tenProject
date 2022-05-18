import 'package:flutter/material.dart';
import 'package:tenshield/Screen/login/login_screen.dart';
import 'package:tenshield/constant/constant.dart';
import 'package:tenshield/constant/size_config.dart';
import 'components/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
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
          child: Container(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, SignInScreen.routeName),
                    child: Text(
                      "  Sign In",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                          fontSize: getProportionateScreenWidth(16.0),
                          color: XWhite),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
