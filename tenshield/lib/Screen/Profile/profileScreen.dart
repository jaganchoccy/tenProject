import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tenshield/Model/user_model.dart';
import 'package:tenshield/Screen/login/login_screen.dart';
import 'package:tenshield/Services/auth.dart';
import 'package:tenshield/components/providerState.dart';
import 'package:tenshield/constant/constant.dart';
import 'package:tenshield/constant/size_config.dart';

class ProfileScreen extends StatefulWidget {
  final user;
  const ProfileScreen({required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.user);
    String? fullname = widget.user.userName;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 91, 94, 94),
        title: Text('Profile'),
      ),
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
        child: Center(
          child: Column(children: [
            Container(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: XGrey,
                child: Text(fullname != null ? "Profile" : fullname!,
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, bottom: 5.0, top: 30),
              child: Container(
                width: double.infinity,
                child: Text(
                  'ADDITION SERVICE',
                  style: TextStyle(
                      color: XWhite, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Color.fromARGB(255, 46, 46, 46),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                          onPressed: null,
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.all(8),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'Manage',
                            style: TextStyle(color: Colors.white60),
                          )),
                      Divider(
                        thickness: 2,
                      ),
                      TextButton(
                          onPressed: null,
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.all(8),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'FAQ    ',
                            style: TextStyle(color: Colors.white60),
                          )),
                      Divider(
                        thickness: 2,
                      ),
                      TextButton(
                          onPressed: null,
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.all(8),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'Permission',
                            style: TextStyle(color: Colors.white60),
                          )),
                      Divider(
                        thickness: 2,
                      ),
                      TextButton(
                          onPressed: null,
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.all(8),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'My Data',
                            style: TextStyle(color: Colors.white60),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, bottom: 5.0, top: 20),
              child: Container(
                width: double.infinity,
                child: Text(
                  'MORE INFORMATION',
                  style: TextStyle(
                      color: XWhite, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Color.fromARGB(255, 35, 35, 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                          onPressed: null,
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.all(8),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'Custom service',
                            style: TextStyle(color: Colors.white60),
                          )),
                      Divider(
                        thickness: 2,
                      ),
                      TextButton(
                          onPressed: null,
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.all(8),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'Privacy policy',
                            style: TextStyle(color: Colors.white60),
                          )),
                      Divider(
                        thickness: 2,
                      ),
                      TextButton(
                          onPressed: null,
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.all(8),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'Terms of use',
                            style: TextStyle(color: Colors.white60),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Color.fromARGB(255, 37, 37, 37),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                          onPressed: null,
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.all(8),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'Setting',
                            style: TextStyle(color: Colors.white60),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            OutlinedButton(
                onPressed: () {
                  logout();
                },
                style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(
                    TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(XRed),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.fromLTRB(0, 5, 0, 5)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3.0))),
                ),
                child: Text(
                  "      Logout      ",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                )),
          ]),
        ),
      ),
    );
  }

  logout() async {
    await FirebaseService().userLogout();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignInScreen()));
  }
}
