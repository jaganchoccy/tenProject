import 'package:flutter/material.dart';
import './size_config.dart';

const appUrl = "http://tenshield.today:3333";

///#08744d
const XPrimaryColor = Color.fromARGB(0xFF, 8, 116, 77);
const XPrimaryColorBorder = Color.fromARGB(0xFF, 27, 92, 67);
//Color.fromARGB(0xFF, 0, 112, 74);
//Color.fromARGB(0xFF, 0, 112, 74);
//
//12,68,145

///#338163

const XPrimaryColor2 = Color.fromARGB(0xFF, 59, 121, 80);
//31/102/202
//
const XPrimaryColor3 = Color.fromARGB(0xFF, 111, 159, 128);

const XGreyBackGround = Color.fromARGB(0xFF, 226, 232, 246);

const XPrimaryLightColor = Color.fromARGB(0xFF, 0, 112, 74);
const XBackGroundColor = Color.fromARGB(0xFF, 247, 247, 247);
const Color transparent = Color(0x00000000);

const XGrey = Color(0xFF757575);
const XRed = Color.fromARGB(0xFF, 222, 38, 32);
const XBlack = Color.fromARGB(255, 0, 0, 0);
const XWhite = Color.fromARGB(255, 255, 255, 255);
const XPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const XSecondaryColor = Color(0xFF979797);
const XTextColor = Color(0xFF757575);

const XAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontFamily: 'Roboto',
  fontStyle: FontStyle.italic,
  fontWeight: FontWeight.bold,
  color: Colors.grey[350],
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String XEmailNullError = "Please enter your email";
const String XInvalidEmailError = "Please enter your valid email";
const String XPassNullError = "Please enter your password";
const String XShortPassError = "Password cannot be empty or Shorter";
const String XMatchPassError = "Passwords don't match";
const String XNamelNullError = "Please enter the user name";
const String XName2NullError = "Please enter the display name";
const String XBioNullError = "Please enter the Bio";
const String XDOBNullError = "Please enter your DOB ";
const String XValidationError = "Fix validation errors";


///////
