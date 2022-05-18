import 'package:flutter/material.dart';
import 'package:tenshield/Screen/sign_up/sign_up_screen.dart';
import 'package:tenshield/constant/constant.dart';
import 'package:tenshield/constant/size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: XBlack,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignUpScreen()),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don’t have an account? ",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(11),
                    color: XWhite,
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.italic),
              ),
              Text(
                "  Sign Up",
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: getProportionateScreenWidth(13.0),
                    color: XWhite),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
