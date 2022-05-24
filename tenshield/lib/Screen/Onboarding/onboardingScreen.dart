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
              height: 40,
            ),
            Text(
              'Activate Air Security',
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
            Text(
              ' Uncompromising air security for every space',
              style: TextStyle(
                fontFamily: "RobotoLight",
                fontSize: 18.0,
                wordSpacing: 1,
                letterSpacing: 1.2,
                fontWeight: FontWeight.normal,
                color: XWhite,
              ),
            ),
            Container(
              width: 250,
              height: 250,
              child: Image.asset(
                  'assets/ten/TenshieldLogo_Transparentbackground.png'),
            ),
            Text(
              'For the best quality of life, the air we breathe must be the purest as possible. According to WHO, air pollution is one of the most serious environmental hazards to human health. Getting hands on an efficient air purifier or sterilizer is one of the most guaranteed ways to remove all sources of pollutants, clean the interior air, improve indoor air quality, and upgrade air security.',
              style: TextStyle(
                fontFamily: "RobotoLight",
                color: XWhite,
                fontSize: 15.0,
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
              height: 30,
            ),
            Text(
              'Pollution knows no boundaries',
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
              height: 10,
            ),
            Text(
              'Get world-class air security with Tenshield',
              style: TextStyle(
                fontFamily: "RobotoLight",
                fontSize: 18.0,
                wordSpacing: 1,
                letterSpacing: 1.2,
                fontWeight: FontWeight.normal,
                color: XWhite,
              ),
            ),
            Container(
              width: double.infinity,
              height: 200,
              child: Image.asset('assets/ten/Atom.png'),
            ),
            Text(
              'Clean air is essential for a healthy human life, nonetheless, it required a global pandemic to finally shed a focus on the quality of indoor air, which was already in crisis even before to COVID-19. We may not be able to see it, but our indoor air contains harmful levels of invisible particulates. Poor indoor air quality can be caused by airborne particles such as dust, pollutants, and pathogens is estimated to cause 3.8 million premature deaths each year, with an untold number of us suffering from harm to wellbeing every day, simply as a result of the air we breathe.',
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
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Container(
                width: double.infinity,
                height: 300,
                child: Image.asset('assets/ten/Sky.png'),
              ),
            ),
            Text(
              'Clean air is essential for a healthy human life, nonetheless, it required a global pandemic to finally shed a focus on the quality of indoor air, which was already in crisis even before to COVID-19. We may not be able to see it, but our indoor air contains harmful levels of invisible particulates. Poor indoor air quality can be caused by airborne particles such as dust, pollutants, and pathogens is estimated to cause 3.8 million premature deaths each year, with an untold number of us suffering from harm to wellbeing every day, simply as a result of the air we breathe.',
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
              height: 20,
            ),
            Text(
              'Tenshield Atom ',
              style: TextStyle(
                fontFamily: "RobotoLight",
                fontSize: 20.0,
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
              'Designed for rooms under 2500 cubic feet like your bedroom or living room, Tenshield Atom purifies the air in every room it is placed in, making it a healthier place for your loved ones. Tenshield Atom - 2500 cu ft - AQI - 70 x 60 x 30 mm',
              style: TextStyle(
                fontFamily: "RobotoLight",
                color: XWhite,
                fontSize: 14.0,
                letterSpacing: 0.7,
                height: 1.5,
              ),
            ),
            Container(
              width: double.infinity,
              height: 200,
              child: Image.asset('assets/ten/Atom.png'),
            ),
            Text(
              'Tenshield Sky',
              style: TextStyle(
                fontFamily: "RobotoLight",
                fontSize: 20.0,
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
              'Using a significantly more powerful ion dispensing technology, TenshieldSky works well for much larger spaces like board rooms, indoor sports arenas, gyms, or places under 15,000 cubic feet.',
              style: TextStyle(
                fontFamily: "RobotoLight",
                color: XWhite,
                fontSize: 14.0,
                letterSpacing: 0.7,
                height: 1.5,
              ),
            ),
            Container(
              width: double.infinity,
              height: 150,
              child: Image.asset('assets/ten/Sky.png'),
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
              activeIndicator: ActiveIndicator(color: XBlack),
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
