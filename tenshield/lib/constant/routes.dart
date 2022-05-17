// We use name route
// All our routes will be available here
import 'package:flutter/cupertino.dart';
import 'package:tenshield/Screen/forgot_password/forgot_password_screen.dart';
import 'package:tenshield/Screen/login/login_screen.dart';
import 'package:tenshield/Screen/sign_up/sign_up_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SignInScreen.routeName: (context) => SignInScreen(),
  // SignUpScreen.routeName: (context) => SignUpScreen(),
  // ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
};
