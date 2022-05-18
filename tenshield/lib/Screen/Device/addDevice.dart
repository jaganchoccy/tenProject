import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_svg/flutter_svg.dart';
import 'package:tenshield/constant/constant.dart';
import 'package:tenshield/constant/size_config.dart';

class AddDeviceScreen extends StatefulWidget {
  const AddDeviceScreen({Key? key}) : super(key: key);

  @override
  State<AddDeviceScreen> createState() => _AddDeviceScreenState();
}

class _AddDeviceScreenState extends State<AddDeviceScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 2))
        ..repeat();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.bottomCenter,
            //stops: [0.7, 0.7],
            end: Alignment.topCenter,
            colors: [
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 91, 94, 94),
            ],
          ),
        ),
        child: Container(
          child: Center(
            child: Column(children: [
              SizedBox(
                height: getProportionateScreenHeight(80),
              ),
              Text(
                'Add New Device',
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(20),
                  color: XWhite,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(80),
              ),
              AnimatedBuilder(
                animation: _controller,
                builder: (_, child) {
                  return Transform.rotate(
                    angle: _controller.value * 2 * math.pi,
                    child: child,
                  );
                },
                child: SvgPicture.asset(
                  'assets/ten/radar.svg',
                  height: getProportionateScreenWidth(200),
                  width: getProportionateScreenWidth(200),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(50),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(14),
                    color: Color.fromARGB(255, 193, 190, 190),
                    height: 1.7,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(40),
              ),
              OutlinedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 29, 145, 33)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0))),
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "  Scan  ",
                        style: TextStyle(
                          fontFamily: "RobotoLight",
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(80),
              ),
              Text(
                'Not able to find need help ?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(14),
                  color: XWhite,
                  height: 1.7,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
