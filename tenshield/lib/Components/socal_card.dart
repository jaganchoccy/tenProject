import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocalCard extends StatelessWidget {
  const SocalCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
    required this.socialBtn,
  }) : super(key: key);

  final String icon;
  final String text;
  final Function press;
  final String socialBtn;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15),
      child: SizedBox(
        width: 50.0,
        height: 50.0,
        child: FloatingActionButton(
          elevation: 1.0,
          backgroundColor: Colors.grey[350],
          heroTag: socialBtn,
          onPressed: press(),
          child: RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: SvgPicture.asset(
                    icon,
                    width: 15,
                    height: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
