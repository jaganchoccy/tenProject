import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tenshield/constant/constant.dart';

Container linearProgress() {
  return Container(
    padding: EdgeInsets.only(bottom: 10.0),
    child: LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation(XPrimaryColor),
    ),
  );
}
