import 'package:flutter/material.dart';
import 'package:tenshield/constant/size_config.dart';
import 'components/body.dart';
import 'package:tenshield/constant/size_config.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/login";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
            /* Do something here if you want */
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Body(),
            bottomNavigationBar: BottomAppBar(
              elevation: 0,
              child: Text(''),
            ),
          ),
        ),
      ),
    );
  }
}
