import 'package:flutter/material.dart';
import 'package:tenshield/Components/default_button.dart';
import 'package:tenshield/Components/snackBar.dart';
import 'package:tenshield/Screen/forgot_password/forgot_password_screen.dart';
import 'package:tenshield/Screen/home/home_screen.dart';
import 'package:tenshield/Services/auth.dart';
import 'package:tenshield/constant/constant.dart';
import 'package:tenshield/constant/size_config.dart';

var currentUser;

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final firebase = FirebaseService();
  late String email;
  late String password;
  bool autoValidate = false;
  final _formKey = GlobalKey<FormState>();

  bool remember = false;

  bool creatBtnclicked = false;

  firebaseSignIn() {
    //isLoginButtonActive = false;
    firebase.loginWithFirestore(this.email, this.password).then((res) {
      //isLoginButtonActive = true;
      if (res == "user-not-found") {
        loadSnackBar(context, 'User not found. Please enter the valid email');
      } else if (res == "wrong-password") {
        loadSnackBar(context, 'Incorrect Password');
      } else if (res == "error") {
        loadSnackBar(context, 'something wrong, please check the network');
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    HomeScreen(currentUser: res, homeIndexPage: 0)),
            (Route<dynamic> route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: !creatBtnclicked
          ? AutovalidateMode.disabled
          : AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(10.0)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(15.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Forgot Password !",
                  style: TextStyle(
                    color: XGrey,
                    fontSize: getProportionateScreenWidth(11),
                    fontFamily: 'RobotoLight',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(8.0)),
          DefaultButton(
              text: "Login",
              press: () {
                setState(() {
                  creatBtnclicked = true;
                });
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  firebaseSignIn();
                } else
                  setState(() {
                    autoValidate = true;
                  });
              }),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(fontSize: 14, color: Colors.black),
      obscureText: true,
      onSaved: (newValue) => password = newValue as String,
      onChanged: (value) {
        password = value;
        return null;
      },
      validator: (value) {
        if ((value!.isEmpty) || (value.length < 6)) {
          return XShortPassError;
        }
        return null;
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(color: XGrey),
        focusedErrorBorder: new OutlineInputBorder(
          borderSide: new BorderSide(color: (Colors.grey[800])!),
          borderRadius: const BorderRadius.all(
            const Radius.circular(6.0),
          ),
        ),
        isDense: true,
        fillColor: Colors.grey[800],
        filled: true,
        border: new OutlineInputBorder(
          borderSide: new BorderSide(color: (Colors.grey[800])!),
          borderRadius: const BorderRadius.all(
            const Radius.circular(6.0),
          ),
        ),
        errorBorder: new OutlineInputBorder(
          borderSide: new BorderSide(color: (Colors.grey[800])!),
          borderRadius: const BorderRadius.all(
            const Radius.circular(6.0),
          ),
        ),
        focusedBorder: new OutlineInputBorder(
          borderSide: new BorderSide(color: (Colors.grey[800])!),
          borderRadius: const BorderRadius.all(
            const Radius.circular(6.0),
          ),
        ),
        enabledBorder: new OutlineInputBorder(
          borderSide: new BorderSide(color: (Colors.grey[800])!),
          borderRadius: const BorderRadius.all(
            const Radius.circular(6.0),
          ),
        ),
        labelText: "Password",
        contentPadding:
            new EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        labelStyle: TextStyle(color: XGrey, fontFamily: "Roboto", fontSize: 13),

        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(fontSize: 14, color: Colors.black),
      onSaved: (newValue) => email = newValue as String,
      onChanged: (value) {
        email = value;
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return XEmailNullError;
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          return XInvalidEmailError;
        }

        return null;
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(color: XGrey),
        focusedErrorBorder: new OutlineInputBorder(
          borderSide: new BorderSide(color: (Colors.grey[800])!),
          borderRadius: const BorderRadius.all(
            const Radius.circular(6.0),
          ),
        ),
        isDense: true,
        fillColor: Colors.grey[800],
        filled: true,
        border: new OutlineInputBorder(
          borderSide: new BorderSide(color: (Colors.grey[800])!),
          borderRadius: const BorderRadius.all(
            const Radius.circular(6.0),
          ),
        ),
        errorBorder: new OutlineInputBorder(
          borderSide: new BorderSide(color: (Colors.grey[800])!),
          borderRadius: const BorderRadius.all(
            const Radius.circular(6.0),
          ),
        ),
        focusedBorder: new OutlineInputBorder(
          borderSide: new BorderSide(color: (Colors.grey[800])!),
          borderRadius: const BorderRadius.all(
            const Radius.circular(6.0),
          ),
        ),
        enabledBorder: new OutlineInputBorder(
          borderSide: new BorderSide(color: (Colors.grey[800]!)),
          borderRadius: const BorderRadius.all(
            const Radius.circular(6.0),
          ),
        ),
        labelText: "E-mail",
        contentPadding:
            new EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        labelStyle: TextStyle(color: XGrey, fontFamily: "Roboto", fontSize: 13),

        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
    );
  }
}
