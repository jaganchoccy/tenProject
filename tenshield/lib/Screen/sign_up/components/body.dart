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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/icons/tenshieldLogo.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: " x",
                              style: TextStyle(
                                  fontFamily: "ComfortaaM",
                                  color: XBlack,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                            WidgetSpan(
                              child: Text(
                                "plore!",
                                style: TextStyle(
                                    fontFamily: "ComfortaaM",
                                    color: XPrimaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
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
