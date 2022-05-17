import 'package:flutter/material.dart';
import 'package:tenshield/constant/constant.dart';

import 'package:tenshield/components/form_error.dart';

import 'package:tenshield/components/default_button.dart';
import 'package:tenshield/constant/size_config.dart';
import 'package:tenshield/services/auth.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(60)),
            child: Column(
              children: [
                Text(
                  "Enter your email and we will send you a link to return to your account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.italic,
                    height: 1.2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 25.0),
                  child: ForgotPassForm(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final firebase = FirebaseService();
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String email = '';

  sendPasswordLink() {
    firebase.forgetPassword(email).thenn((res) {});
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            style: TextStyle(fontSize: 14, color: Colors.grey[350]),
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue.toString(),
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(XEmailNullError)) {
                setState(() {
                  errors.remove(XEmailNullError);
                });
              } else if (emailValidatorRegExp.hasMatch(value) &&
                  errors.contains(XInvalidEmailError)) {
                setState(() {
                  errors.remove(XInvalidEmailError);
                });
              }
              return null;
            },
            validator: (value) {
              if (value!.isEmpty && !errors.contains(XEmailNullError)) {
                setState(() {
                  errors.add(XEmailNullError);
                });
              } else if (!emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(XInvalidEmailError)) {
                setState(() {
                  errors.add(XInvalidEmailError);
                });
              }
              return null;
            },
            decoration: InputDecoration(
              isDense: true,
              labelText: "Enter your email",
              fillColor: Colors.grey[300],
              filled: true,

              border: new OutlineInputBorder(
                borderSide: new BorderSide(color: (Colors.grey[300])!),
                borderRadius: const BorderRadius.all(
                  const Radius.circular(6.0),
                ),
              ),
              errorBorder: new OutlineInputBorder(
                borderSide: new BorderSide(color: (Colors.grey[300])!),
                borderRadius: const BorderRadius.all(
                  const Radius.circular(6.0),
                ),
              ),
              focusedBorder: new OutlineInputBorder(
                borderSide: new BorderSide(color: (Colors.grey[300])!),
                borderRadius: const BorderRadius.all(
                  const Radius.circular(6.0),
                ),
              ),
              enabledBorder: new OutlineInputBorder(
                borderSide: new BorderSide(color: (Colors.grey[300])!),
                borderRadius: const BorderRadius.all(
                  const Radius.circular(6.0),
                ),
              ),
              contentPadding:
                  new EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              labelStyle:
                  TextStyle(color: XGrey, fontFamily: "Roboto", fontSize: 13),

              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
          ),
          FormError(errors: errors),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 60),
            child: DefaultButton(
              text: "Continue",
              press: () {
                if (_formKey.currentState!.validate()) {
                  sendPasswordLink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
