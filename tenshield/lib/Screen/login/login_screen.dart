import 'package:flutter/material.dart';
import 'package:tenshield/Components/no_account_text.dart';
import 'package:tenshield/constant/size_config.dart';
import 'components/body.dart';
import 'package:tenshield/constant/size_config.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/login";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
            /* Do something here if you want */
          },
          child: Scaffold(
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
              elevation: 0,
              child: NoAccountText(),
            ),
          ),
        ),
      ),
    );
  }
}
