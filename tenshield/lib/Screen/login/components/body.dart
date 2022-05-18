import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tenshield/Screen/home/home_screen.dart';
import 'package:tenshield/components/providerState.dart';
import 'package:tenshield/constant/constant.dart';
import 'package:tenshield/constant/size_config.dart';
import 'package:tenshield/services/auth.dart';

import 'sign_form.dart';

import 'dart:io' show Platform;

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final firebase = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(top: 0, left: 0, right: 0),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 0,
                      left: MediaQuery.of(context).size.width / 6,
                      right: MediaQuery.of(context).size.width / 6),
                  child: Container(
                    width: double.infinity,
                    child: SvgPicture.asset(
                      'assets/ten/undraw_internet_on_the_go_re_vben.svg',
                      height: getProportionateScreenWidth(180),
                      width: getProportionateScreenWidth(180),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 0, bottom: 5),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "Welcome to TenShield",
                          style: TextStyle(
                              fontSize: 30,
                              color: XWhite,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Lorem Ipsum is simply ds been the industry's st asdjkjasd kajsdkjnanknown asdas  printer took a galley of type and scrambled it to make a type specimen book.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                color: XGrey,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(50)),
                child: SignForm(),
              ),
              SizedBox(height: getProportionateScreenHeight(2)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(50)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (Platform.isIOS)
                      Expanded(
                        child: Container(
                          child: ButtonTheme(
                            height: 20,
                            child: OutlinedButton(
                              onPressed: () {
                                firebase.signInWithApple().then((cUser) => {
                                      currentUser = cUser!,
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (BuildContext context) {
                                            return HomeScreen(
                                                currentUser:
                                                    UserChangeNotifier()
                                                        .getCurrentUser!,
                                                homeIndexPage: 0);
                                          },
                                        ),
                                      )
                                    });
                              },
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.fromLTRB(0, 5, 0, 5)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(3.0))),
                              ),
                              child: Container(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: SvgPicture.asset(
                                          "assets/icons/Apple_logo_black.svg",
                                          width: 14,
                                          height: 14,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "  Sign in with Apple",
                                        style: TextStyle(
                                          fontFamily: "Roboto",
                                          fontWeight: FontWeight.w400,
                                          fontSize:
                                              getProportionateScreenWidth(12),
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    SizedBox(width: 0),
                    Expanded(
                      child: Container(
                        child: ButtonTheme(
                          height: 20,
                          child: OutlinedButton(
                            onPressed: () {
                              firebase.signInWithGoogle().then((cUser) => {
                                    currentUser = cUser!,
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) {
                                        return HomeScreen(
                                            currentUser: UserChangeNotifier()
                                                .getCurrentUser!,
                                            homeIndexPage: 0);
                                      }),
                                    )
                                  });
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  (Color.fromARGB(255, 43, 42, 42))),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(3.0))),
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: SvgPicture.asset(
                                      "assets/icons/google-icon.svg",
                                      width: 14,
                                      height: 14,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "  Google",
                                    style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w400,
                                      fontSize: getProportionateScreenWidth(13),
                                      color: XWhite,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
