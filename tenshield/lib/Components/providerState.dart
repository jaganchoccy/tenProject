import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tenshield/Model/user_model.dart';

import 'package:tenshield/services/auth.dart';

var currentUserData;
final firebase = FirebaseService();

class UserChangeNotifier extends ChangeNotifier {
  get getCurrentUser => currentUserData;

  set setCurrentUser(UserModel user) {
    currentUserData = user;
    notifyListeners();
  }

  Future getUserInfo() async {
    //return true;
    final uid = firebase.getCurrentUid();
    if (uid == null) {
      return false;
    }

    return true;
  }
}
