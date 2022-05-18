import 'package:flutter/material.dart';
import 'package:tenshield/constant/constant.dart';
import 'package:tenshield/constant/size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.press,
    this.isActive: true,
  }) : super(key: key);
  final String text;
  final VoidCallback press;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getProportionateScreenHeight(36),
      decoration: BoxDecoration(
        color: isActive
            ? Color.fromARGB(255, 43, 42, 42)
            : Color.fromARGB(255, 40, 40, 40),
        borderRadius: BorderRadius.circular(3.0),
        // gradient: LinearGradient(
        //   begin: Alignment.bottomRight,
        //   end: Alignment.topLeft,
        //   //stops: [0.1, 0.2],
        //   colors: [XPrimaryColor, XPrimaryColor2],
        // ),
      ),
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
            side: BorderSide(color: XPrimaryColorBorder)),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w400,
            fontSize: getProportionateScreenWidth(13),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
