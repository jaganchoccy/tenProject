import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tenshield/Screen/Onboarding/onboardingScreen.dart';
import 'package:tenshield/Screen/home/home_screen.dart';
import 'package:tenshield/Screen/login/login_screen.dart';
import 'package:tenshield/components/providerState.dart';
import 'package:provider/provider.dart';
import 'package:tenshield/constant/constant.dart';
import 'package:tenshield/constant/routes.dart';
import 'package:tenshield/constant/size_config.dart';
import 'package:tenshield/constant/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  //AdMobService.Initialize();
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  ).then((_) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => UserChangeNotifier()),
        ],
        child: tenshield(),
      ),
    );
  });
}

//SignInScreen()
class tenshield extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'tenshield!',
      theme: theme(),
      home: SplashScreen(),
      routes: routes,
    );
  }
}

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showSp = true;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        this.showSp = false;
        timer.cancel();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return showSp
        ? Center(
            child: Container(
              width: 250,
              height: 250,
              child: Image.asset(
                  'assets/ten/TenshieldLogo_Transparentbackground.png'),
            ),
          )
        : load();
  }
}

load() {
  return FutureBuilder(
    future: UserChangeNotifier().getUserInfo(),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.none:
          return Text('no connection');
        case ConnectionState.active:
          return Center(child: Text("active Connection"));
        case ConnectionState.waiting:
          return Scaffold(
            backgroundColor: XBlack,
            body: Center(child: Text('loading..')),
            bottomNavigationBar: Container(
              width: double.infinity,
              height: 50,
              child: Text(
                '...company name here...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'tenshield',
                  color: XGrey,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          );

        case ConnectionState.done:
          if (snapshot.hasError) {
            return Center(child: Text("Error occured!"));
          } else if (snapshot.hasData) {
            return OnboardScreen(currentUser: snapshot.data);
            //return HomeScreen(currentUser: snapshot.data, homeIndexPage: 0);
            //return Connection();
          } else {
            return OnboardScreen(currentUser: snapshot.data);
            //Timer(Duration(seconds: 4), () => print("5sec"));
          }
      }
    },
  );
}
