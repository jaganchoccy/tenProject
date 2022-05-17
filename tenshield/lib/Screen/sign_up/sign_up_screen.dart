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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Sign Up",
            style: TextStyle(
              fontFamily: "RobotoLight",
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: .2,
              color: XBlack,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Body(),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            color: Colors.white,
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
                          color: XBlack),
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
