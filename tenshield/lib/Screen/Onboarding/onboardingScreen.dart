import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onboarding/onboarding.dart';
import 'package:tenshield/Screen/home/home_screen.dart';
import 'package:tenshield/Screen/login/login_screen.dart';
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
              height: 50,
            ),
            Text(
              'SHARE YOUR EXPERIENCE.',
              style: TextStyle(
                fontFamily: "RobotoLight",
                fontSize: 22.0,
                wordSpacing: 1,
                letterSpacing: 1.2,
                fontWeight: FontWeight.bold,
                color: XWhite,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 300,
              child: SvgPicture.asset(
                'assets/ten/undraw_progress_overview_re_tvcl.svg',
                height: getProportionateScreenWidth(180),
                width: getProportionateScreenWidth(180),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
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
          ],
        ),
      ),
      PageModel(
        widget: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              'TITLE 2.',
              style: TextStyle(
                fontFamily: "RobotoLight",
                fontSize: 22.0,
                wordSpacing: 1,
                letterSpacing: 1.2,
                fontWeight: FontWeight.bold,
                color: XWhite,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 300,
              child: SvgPicture.asset(
                'assets/ten/undraw_pie_graph_re_fvol.svg',
                height: getProportionateScreenWidth(180),
                width: getProportionateScreenWidth(180),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
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
          ],
        ),
      ),
      PageModel(
        widget: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              'TITLE 3.',
              style: TextStyle(
                fontFamily: "RobotoLight",
                fontSize: 22.0,
                wordSpacing: 1,
                letterSpacing: 1.2,
                fontWeight: FontWeight.bold,
                color: XWhite,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 300,
              child: SvgPicture.asset(
                'assets/ten/undraw_internet_on_the_go_re_vben.svg',
                height: getProportionateScreenWidth(180),
                width: getProportionateScreenWidth(180),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
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
          ],
        ),
      ),
    ];

    return Scaffold(
        body: Container(
      child: Center(
        child: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              begin: Alignment.bottomCenter,
              //stops: [0.1, 0.4, 0.7],
              end: Alignment.topCenter,
              colors: [
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 51, 52, 52),
              ],
            ),
          ),
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
                      builder: (context) => SignInScreen(),
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
      ),
    ));
  }
}
