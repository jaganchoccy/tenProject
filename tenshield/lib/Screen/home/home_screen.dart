import 'package:flutter/material.dart';
import 'package:tenshield/components/providerState.dart';
import 'package:tenshield/constant/constant.dart';

// import 'package:tenshield/screens/Feeds/time_line.dart';

// import 'package:tenshield/screens/Trips/trip_screen.dart';

class HomeScreen extends StatefulWidget {
  final currentUser;
  final int homeIndexPage;
  HomeScreen({required this.currentUser, required this.homeIndexPage});

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
        child: Scaffold(
          key: _scaffoldKey,
          body: PageView(
            children: [
              Text(
                  'datajhgjh jgjh gj jhg hjgkj khfkhkhfkhfkhfkhfkhfkhf khgf k fkhgfkhf kghf khg'),
              Text(
                  'datajhgjh jgjh gj jhg hjgkj khfkhkhfkhfkhfkhfkhfkhf khgf k fkhgfkhf kghf khg')
              //GoogleAdMob(),
              //MembersScreen(currentUser: widget.currentUser),
            ],
            controller: pageController,
            onPageChanged: whenPagechanged,
            physics: NeverScrollableScrollPhysics(),
          ),
          floatingActionButton: new FloatingActionButton(
            onPressed: () {},
            tooltip: 'Increment',
            child: new Icon(Icons.add),
            elevation: 4.0,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: getPageIndex,
            selectedFontSize: 12.0,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            elevation: 5.0,
            unselectedItemColor: Colors.grey[600],
            selectedItemColor: Colors.black,
            showUnselectedLabels: true,
            selectedIconTheme: IconThemeData(color: XPrimaryColor),
            unselectedIconTheme: IconThemeData(color: Colors.grey[600]),
            selectedLabelStyle: TextStyle(color: Colors.black),
            onTap: onTapchangePage,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.supervised_user_circle),
                label: 'Club',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.radio_button_unchecked),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
