import 'package:flutter/material.dart';
import 'package:tenshield/Screen/Device/addDevice.dart';
import 'package:tenshield/Screen/Profile/profileScreen.dart';
import 'package:tenshield/Screen/chart/chartScreen.dart';
import 'package:tenshield/components/providerState.dart';
import 'package:tenshield/constant/constant.dart';

// import 'package:tenshield/screens/Feeds/time_line.dart';

// import 'package:tenshield/screens/Trips/trip_screen.dart';

class HomeScreen extends StatefulWidget {
  final int homeIndexPage;
  HomeScreen({required this.homeIndexPage});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  // FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  late PageController pageController;
  late var currentUserSet;
  int getPageIndex = 0;
  @override
  void initState() {
    super.initState();
    getPageIndex = widget.homeIndexPage;
    pageController = PageController();
  }

  configurePushNotifications() async {
    // if (Platform.isIOS) getiOSPermission();
    // _firebaseMessaging.getToken().then((token) {
    //   usersRef
    //       .doc(widget.currentUser.uid)
    //       .update({"androidNotificationToken": token});
    // });

    // _firebaseMessaging.configure(
    //   // onLaunch: (Map<String, dynamic> message) async {},
    //   // onResume: (Map<String, dynamic> message) async {},
    //   onMessage: (Map<String, dynamic> message) async {
    //     final String recipientId = message['data']['recipient'];
    //     final String body = message['notification']['body'];
    //     if (recipientId == widget.currentUser.uid) {
    //       SnackBar snackbar = SnackBar(
    //           content: Text(
    //         body,
    //         overflow: TextOverflow.ellipsis,
    //       ));
    //       _scaffoldKey.currentState.showSnackBar(snackbar);
    //     }
    //   },
    // );
  }

  // getiOSPermission() {
  //   _firebaseMessaging.requestNotificationPermissions(
  //       IosNotificationSettings(alert: true, badge: true, sound: true));
  //   _firebaseMessaging.onIosSettingsRegistered.listen((settings) {});
  // }

  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  whenPagechanged(int pageIndex) {
    if (mounted) {
      setState(() {
        this.getPageIndex = pageIndex;
      });
    }
  }

  onTapchangePage(int pageIndex) {
    pageController.animateToPage(pageIndex,
        duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        /* Do something here if you want */
        return false;
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: Scaffold(
            key: _scaffoldKey,
            body: Container(
              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                  begin: Alignment.bottomCenter,
                  //stops: [0.7, 0.7],
                  end: Alignment.topCenter,
                  colors: [
                    Color.fromARGB(255, 0, 0, 0),
                    Color.fromARGB(255, 51, 52, 52),
                  ],
                ),
              ),
              child: PageView(
                children: [
                  ChatScreen(user: UserChangeNotifier().getCurrentUser),
                  ProfileScreen(user: UserChangeNotifier().getCurrentUser),
                  //GoogleAdMob(),
                  //MembersScreen(currentUser: widget.currentUser),
                ],
                controller: pageController,
                onPageChanged: whenPagechanged,
                physics: NeverScrollableScrollPhysics(),
              ),
            ),
            floatingActionButton: Padding(
              padding: EdgeInsets.only(top: 20),
              child: SizedBox(
                height: 70,
                width: 70,
                child: FloatingActionButton(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddDeviceScreen()),
                    );
                  },
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 4),
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: const Alignment(0.7, -0.5),
                        end: const Alignment(0.6, 0.5),
                        colors: [
                          Color(0xFF53a78c),
                          Color(0xFF70d88b),
                        ],
                      ),
                    ),
                    child: Icon(Icons.add, size: 30),
                  ),
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: getPageIndex,
              selectedFontSize: 12.0,
              backgroundColor: Colors.black,
              type: BottomNavigationBarType.fixed,
              elevation: 5.0,
              unselectedItemColor: Colors.grey[600],
              selectedItemColor: Colors.white,
              showUnselectedLabels: true,
              selectedIconTheme: IconThemeData(color: XPrimaryColor),
              unselectedIconTheme: IconThemeData(color: Colors.grey[600]),
              selectedLabelStyle: TextStyle(color: Colors.white),
              onTap: onTapchangePage,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.supervised_user_circle),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
