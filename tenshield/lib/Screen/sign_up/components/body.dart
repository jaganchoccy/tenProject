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
                        fontSize: 30,
                        color: XWhite,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: " ten ",
                              style: TextStyle(
                                  fontFamily: "ComfortaaM",
                                  color: Color.fromARGB(255, 93, 205, 93),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                            WidgetSpan(
                              child: Text(
                                "shield",
                                style: TextStyle(
                                    fontFamily: "ComfortaaM",
                                    color: XBlack,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
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
