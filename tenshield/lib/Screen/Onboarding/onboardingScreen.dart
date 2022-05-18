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
                color: XWhite,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Create posts and videos to share your travel experiences.',
              style: TextStyle(
                fontFamily: "RobotoLight",
                color: XWhite,
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
                color: XWhite,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Etenshield a world of tours, activities, and attractions.',
              style: TextStyle(
                fontFamily: "RobotoLight",
                color: XWhite,
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
                color: XWhite,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Create trip, attend meet-ups and events, find your people and make new friends.',
              style: TextStyle(
                fontFamily: "RobotoLight",
                color: XWhite,
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
                color: XWhite,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Find people with similar interests and make new friends.',
              style: TextStyle(
                fontFamily: "RobotoLight",
                color: XWhite,
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
        body: Container(
      decoration: new BoxDecoration(
          gradient: new LinearGradient(
        begin: Alignment.bottomCenter,
        stops: [0.1, 0.4, 0.7],
        end: Alignment.topCenter,
        colors: [
          Color.fromARGB(255, 0, 0, 0),
          Color.fromARGB(255, 125, 129, 129),
          Color.fromARGB(255, 0, 0, 0),
        ],
      )),
      child: Center(
        child: Onboarding(
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
            activeIndicator: ActiveIndicator(color: XWhite),
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
