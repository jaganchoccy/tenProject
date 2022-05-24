import 'package:flutter/material.dart';
import 'package:tenshield/constant/constant.dart';
import 'package:tenshield/constant/size_config.dart';
import 'sign_up_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(60)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white24,
                        fontWeight: FontWeight.w400),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 250,
                        height: 100,
                        child: Image.asset(
                            'assets/ten/TenshieldLogo_Transparentbackground.png'),
                      ),
                    ],
                  ),
                  SignUpForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
