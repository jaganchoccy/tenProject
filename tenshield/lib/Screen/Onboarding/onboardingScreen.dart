import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onboarding/onboarding.dart';
import 'package:tenshield/Screen/home/home_screen.dart';
import 'package:tenshield/components/confetti_celebrate.dart';
import 'package:tenshield/components/providerState.dart';
import 'package:tenshield/constant/constant.dart';
import 'package:tenshield/constant/size_config.dart';

class OnboardScreen extends StatefulWidget {
  final currentUser;
  OnboardScreen({required this.currentUser});

  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  Widget build(BuildContext context) {
    final onboardingPagesList = [
      PageModel(
        widget: Container(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(80),
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "x",
                          style: TextStyle(
                              fontFamily: "ComfortaaM",
                              color: XBlack,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        WidgetSpan(
                          child: Text(
                            "plore!",
                            style: TextStyle(
                                fontFamily: "ComfortaaM",
                                color: XPrimaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(40),
                ),
                Container(
                  alignment: Alignment.center,
                  child: AllConfettiWidget(
                    child: Container(
                      width: double.infinity,
                      child: SvgPicture.asset(
                        'assets/images/celebrate.svg',
                        height: 200, //40%
                        width: 200,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Hey ",
                        style: TextStyle(
                          fontSize: 16.0,
                          wordSpacing: 1,
                          letterSpacing: 1.2,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal,
                          color: XBlack,
                        ),
                      ),
                      WidgetSpan(
                        child: Text(
                          '${widget.currentUser.fullName} !',
                          style: TextStyle(
                            fontSize: 16.0,
                            wordSpacing: 1,
                            letterSpacing: 1.2,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            color: XBlack,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    'We are so happy to see you here. your support means a lot in creating a great platform for the world. Happy journey with tenshield begins now...!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "RobotoLight",
                      color: XBlack,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w100,
                      height: 1.5,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
      PageModel(
        widget: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(50),
            ),
            Text(
              'SHARE YOUR EXPERIENCE.',
              style: TextStyle(
                fontFamily: "RobotoLight",
                fontSize: 23.0,
                wordSpacing: 1,
                letterSpacing: 1.2,
                fontWeight: FontWeight.bold,
                color: XBlack,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Create posts and videos to share your travel experiences.',
              style: TextStyle(
                fontFamily: "RobotoLight",
                color: Colors.black,
                fontSize: 14.0,
                letterSpacing: 0.7,
                height: 1.5,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: getProportionateScreenWidth(220),
              height: getProportionateScreenWidth(450),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/42.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
      PageModel(
        widget: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(50),
            ),
            Text(
              'CONNECT. Etenshield. SHARE.',
              style: TextStyle(
                fontFamily: "RobotoLight",
                fontSize: 23.0,
                wordSpacing: 1,
                letterSpacing: 1.2,
                fontWeight: FontWeight.bold,
                color: XBlack,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Etenshield a world of tours, activities, and attractions.',
              style: TextStyle(
                fontFamily: "RobotoLight",
                color: Colors.black,
                fontSize: 14.0,
                letterSpacing: 0.7,
                height: 1.5,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: getProportionateScreenWidth(220),
              height: getProportionateScreenWidth(450),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/44.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
      PageModel(
        widget: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(50),
            ),
            Text(
              'JOIN THE COMMUNITY.',
              style: TextStyle(
                fontFamily: "RobotoLight",
                fontSize: 23.0,
                wordSpacing: 1,
                letterSpacing: 1.2,
                fontWeight: FontWeight.bold,
                color: XBlack,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Create trip, attend meet-ups and events, find your people and make new friends.',
              style: TextStyle(
                fontFamily: "RobotoLight",
                color: Colors.black,
                fontSize: 14.0,
                letterSpacing: 0.7,
                height: 1.5,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: getProportionateScreenWidth(220),
              height: getProportionateScreenWidth(450),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/43.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
      PageModel(
        widget: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(50),
            ),
            Text(
              'PROFILE',
              style: TextStyle(
                fontFamily: "RobotoLight",
                fontSize: 23.0,
                wordSpacing: 1,
                letterSpacing: 1.2,
                fontWeight: FontWeight.bold,
                color: XBlack,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Find people with similar interests and make new friends.',
              style: TextStyle(
                fontFamily: "RobotoLight",
                color: Colors.black,
                fontSize: 14.0,
                letterSpacing: 0.7,
                height: 1.5,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: getProportionateScreenWidth(220),
              height: getProportionateScreenWidth(450),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/41.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    ];

    return Scaffold(
        backgroundColor: XGrey,
        body: Container(
          child: Center(
            child: Onboarding(
              background: Colors.white,
              proceedButtonStyle: ProceedButtonStyle(
                  proceedButtonColor: XPrimaryColor,
                  proceedpButtonText: Text('Get Started',
                      style: TextStyle(
                        fontFamily: "RobotoLight",
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      )),
                  proceedButtonRoute: (context) {
                    return Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(
                            currentUser: UserChangeNotifier().getCurrentUser!,
                            homeIndexPage: 0),
                      ),
                      (route) => false,
                    );
                  }),
              pages: onboardingPagesList,
              indicator: Indicator(
                activeIndicator: ActiveIndicator(color: XBlack),
                indicatorDesign: IndicatorDesign.line(
                  lineDesign: LineDesign(
                    lineType: DesignType.line_nonuniform,
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
