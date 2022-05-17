import 'package:flutter/material.dart';
import 'package:tenshield/Components/default_button.dart';
import 'package:tenshield/Components/snackBar.dart';
import 'package:tenshield/Services/auth.dart';

import 'package:tenshield/components/providerState.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tenshield/constant/constant.dart';
import 'package:tenshield/constant/size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final firebase = FirebaseService();
  final _formKey = GlobalKey<FormState>();
  late String userName;
  late String email;
  late String password;
  late String confirmPassword;
  bool creatBtnclicked = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: !creatBtnclicked
          ? AutovalidateMode.disabled
          : AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          buildUserNameFormField(),
          SizedBox(height: getProportionateScreenHeight(15)),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(15)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(15)),
          buildConformPassFormField(),
          SizedBox(height: getProportionateScreenHeight(10)),
          SizedBox(height: getProportionateScreenHeight(30)),
          creatBtnclicked == false
              ? DefaultButton(
                  text: "Create Account",
                  press: () async {
                    setState(() {
                      creatBtnclicked = true;
                    });
                    //check user availablity
                    // var isUniqueUser =
                    //     await UserController().getUniqueUser(this.userName);

                    // if (isUniqueUser == null) {
                    //   loadSnackBar(context, 'something went wrong!');
                    //   setState(() {
                    //     creatBtnclicked = false;
                    //   });
                    //   return;
                    // } else if (!isUniqueUser) {
                    //   loadSnackBar(context, 'Username already exist');
                    //   setState(() {
                    //     creatBtnclicked = false;
                    //   });
                    //   return;
                    // }

                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      firebase
                          .createAccountWithFirebase(this.email, this.password)
                          .then((res) {
                        if (res == "weak-password") {
                          loadSnackBar(context, 'please enter strong password');
                        } else if (res == "email-already-in-use") {
                          loadSnackBar(context,
                              'email already in use, please enter new email ');
                        } else if (res == "error") {
                          loadSnackBar(context,
                              'something went wrong, please check your network');
                        } else {
                          // Auth()
                          //     .registerUser(res.user, this.userName)
                          //     .then((result) => {
                          //           setState(() {
                          //             creatBtnclicked = false;
                          //           }),
                          //           Navigator.of(context).pop(),
                          //           Navigator.of(context).pushReplacement(
                          //             MaterialPageRoute(
                          //                 builder: (BuildContext context) =>
                          //                     UserRoleScreen(
                          //                         currentUser:
                          //                             UserChangeNotifier()
                          //                                 .getCurrentUser!)),
                          //           )
                          //         });
                        }
                        setState(() {
                          creatBtnclicked = false;
                        });
                      });
                    } else {
                      setState(() {
                        creatBtnclicked = false;
                      });
                    }
                  },
                )
              : Container(
                  child: Center(
                    child: LoadingAnimationWidget.staggeredDotsWave(
                      color: Color.fromARGB(255, 13, 170, 107),
                      size: 100,
                    ),
                  ),
                ),
          SizedBox(height: getProportionateScreenHeight(15)),
        ],
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      style: TextStyle(fontSize: 14, color: Colors.black),
      obscureText: true,
      onSaved: (newValue) => confirmPassword = newValue as String,
      onChanged: (value) {
        confirmPassword = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return XPassNullError;
        } else if ((password != value)) {
          return XMatchPassError;
        }
        return null;
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(color: XGrey),
        focusedErrorBorder: new OutlineInputBorder(
          borderSide: new BorderSide(color: (Colors.grey[200])!),
          borderRadius: const BorderRadius.all(
            const Radius.circular(6.0),
          ),
        ),
        isDense: true,
        fillColor: Colors.grey[200],
        filled: true,
        border: new OutlineInputBorder(
          borderSide: new BorderSide(color: (Colors.grey[200])!),
          borderRadius: const BorderRadius.all(
            const Radius.circular(6.0),
          ),
        ),
        errorBorder: new OutlineInputBorder(
          borderSide: new BorderSide(color: (Colors.grey[200])!),
          borderRadius: const BorderRadius.all(
            const Radius.circular(6.0),
          ),
        ),
        focusedBorder: new OutlineInputBorder(
          borderSide: new BorderSide(color: (Colors.grey[200])!),
          borderRadius: const BorderRadius.all(
            const Radius.circular(6.0),
          ),
        ),
        enabledBorder: new OutlineInputBorder(
          borderSide: new BorderSide(color: (Colors.grey[200])!),
          borderRadius: const BorderRadius.all(
            const Radius.circular(6.0),
          ),
        ),
        labelText: "Confirm Password",
        contentPadding:
            new EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        labelStyle: TextStyle(color: XGrey, fontFamily: "Roboto", fontSize: 13),

        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      style: TextStyle(fontSize: 14, color: Colors.black),
      obscureText: true,
      onSaved: (newValue) => password = newValue as String,
      onChanged: (value) {
        password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return XPassNullError;
        } else if (value.length < 6) {
          return XShortPassError;
        }
        return null;
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(color: XGrey),
        focusedErrorBorder: new OutlineInputBorder(
          borderSide: new BorderSide(color: (Colors.grey[200])!),
          borderRadius: const BorderRadius.all(
            const Radius.circular(6.0),
          ),
        ),
        isDense: true,
        fillColor: Colors.grey[200],
        filled: true,
        border: new OutlineInputBorder(
          borderSide: new BorderSide(color: (Colors.grey[200])!),
          borderRadius: const BorderRadius.all(
            const Radius.circular(6.0),
          ),
        ),
        errorBorder: new OutlineInputBorder(
          borderSide: new BorderSide(color: (Colors.grey[200])!),
          borderRadius: const BorderRadius.all(
            const Radius.circular(6.0),
          ),
        ),
        focusedBorder: new OutlineInputBorder(
          borderSide: new BorderSide(color: (Colors.grey[200])!),
          borderRadius: const BorderRadius.all(
            const Radius.circular(6.0),
          ),
        ),
        enabledBorder: new OutlineInputBorder(
          borderSide: new BorderSide(color: (Colors.grey[200])!),
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
      style: TextStyle(fontSize: 14, color: Colors.black),
      keyboardType: TextInputType.emailAddress,
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
          borderSide: new BorderSide(color: (Colors.grey[200])!),
          borderRadius: const BorderRadius.all(
            const Radius.circular(6.0),
          ),
        ),
        isDense: true,
        fillColor: Colors.grey[200],
        filled: true,
        border: new OutlineInputBorder(
          borderSide: new BorderSide(color: (Colors.grey[200])!),
          borderRadius: const BorderRadius.all(
            const Radius.circular(6.0),
          ),
        ),
        errorBorder: new OutlineInputBorder(
          borderSide: new BorderSide(color: (Colors.grey[200])!),
          borderRadius: const BorderRadius.all(
            const Radius.circular(6.0),
          ),
        ),
        focusedBorder: new OutlineInputBorder(
          borderSide: new BorderSide(color: (Colors.grey[200])!),
          borderRadius: const BorderRadius.all(
            const Radius.circular(6.0),
          ),
        ),
        enabledBorder: new OutlineInputBorder(
          borderSide: new BorderSide(color: (Colors.grey[200])!),
          borderRadius: const BorderRadius.all(
            const Radius.circular(6.0),
          ),
        ),
        labelText: "Email",
        contentPadding:
            new EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        labelStyle: TextStyle(color: XGrey, fontFamily: "Roboto", fontSize: 13),

        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
    );
  }

  buildUserNameFormField() {
    return TextFormField(
      style: TextStyle(fontSize: 14, color: Colors.black),
      onSaved: (newValue) => userName = newValue as String,
      onChanged: (value) {
        userName = value;
        return null;
      },
      maxLength: 15,
      validator: (value) {
        if (value!.isEmpty) {
          return XNamelNullError;
        }
        return value.length < 4
            ? 'Name must be greater than four characters'
            : null;
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(color: XGrey),
        focusedErrorBorder: new OutlineInputBorder(
          borderSide: new BorderSide(color: (Colors.grey[200])!),
          borderRadius: const BorderRadius.all(
            const Radius.circular(6.0),
          ),
        ),
        isDense: true,
        fillColor: Colors.grey[200],
        filled: true,
        border: new OutlineInputBorder(
          borderSide: new BorderSide(color: (Colors.grey[200])!),
          borderRadius: const BorderRadius.all(
            const Radius.circular(6.0),
          ),
        ),
        errorBorder: new OutlineInputBorder(
          borderSide: new BorderSide(color: (Colors.grey[200])!),
          borderRadius: const BorderRadius.all(
            const Radius.circular(6.0),
          ),
        ),
        focusedBorder: new OutlineInputBorder(
          borderSide: new BorderSide(color: (Colors.grey[200])!),
          borderRadius: const BorderRadius.all(
            const Radius.circular(6.0),
          ),
        ),
        enabledBorder: new OutlineInputBorder(
          borderSide: new BorderSide(color: (Colors.grey[200])!),
          borderRadius: const BorderRadius.all(
            const Radius.circular(6.0),
          ),
        ),
        labelText: "User Name *",
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
