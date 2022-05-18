import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:tenshield/services/auth.dart';

var currentUserData;

class UserChangeNotifier extends ChangeNotifier {
  get getCurrentUser => currentUserData;

  set setCurrentUser(user) {
    currentUserData = user;
    notifyListeners();
  }

  Future getUserInfo() async {
    return true;
    // final uid = firebase.getCurrentUid();
    // try {
    //   if (uid != null) {
    //     var resUser = await UserController().getUserById(uid);
    //     if (resUser == null) {
    //       await FirebaseService().userLogout();
    //       SharedPreferences preferences = await SharedPreferences.getInstance();
    //       await preferences.clear();
    //     }
    //     return resUser;
    //   }
    // } catch (e) {}
    // return currentUserData;
  }
}
