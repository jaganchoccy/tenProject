import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPreferenceHelper {
  static String userIdKey = "USERIDKEY";
  static String userNameKey = "USERNAMEKEY";
  static String displayNameKey = "USERDISPLAYNAME";
  static String userEmailKey = "USEREMAILKEY";
  static String userProfilePicKey = "USERPROFILEKEY";
  static String userDataKey = "USERDATAKEY";
  static String userTokenKey = "USERTOKENKEY";

  //save data
  Future<bool> saveUserToken(String userToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userTokenKey, userToken);
  }

  //save data
  Future<bool> saveUserName(String? userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userNameKey, userName!);
  }

  Future<bool> saveUserEmail(String? getUseremail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userEmailKey, getUseremail!);
  }

  Future<bool> saveUserId(String? getUserId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userIdKey, getUserId!);
  }

  Future<bool> saveDisplayName(String? getDisplayName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(displayNameKey, getDisplayName!);
  }

  Future<bool> saveUserProfileUrl(String? getUserProfile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userProfilePicKey, getUserProfile!);
  }

  Future<Object> saveUserData(Object getUserData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userDataKey, jsonEncode(getUserData));
  }

  //get

  Future<String?> getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userTokenKey);
  }

  Future<String?> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userNameKey);
  }

  Future<String?> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userEmailKey);
  }

  Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userIdKey);
  }

  Future<String?> getDisplayName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(displayNameKey);
  }

  Future<String?> getUserProfileUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userProfilePicKey);
  }

  Future<Object> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString(userDataKey);
    Map<String, dynamic> userMap =
        jsonDecode(userPref!) as Map<String, dynamic>;
    return userMap;
  }
}
