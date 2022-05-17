import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tenshield/Components/providerState.dart';
import 'package:tenshield/helper/sharedPre.dart';

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

class FirebaseService {
  late final cUser;

//User status

  get ctUser1 {
    return cUser;
  }

  set ctUser(name) {
    this.cUser = name;
  }

//signIn in firebase
  loginWithFirestore(email, password) async {
    try {
      final cUser;
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      User? userDetails = userCredential.user;

      Map<String, dynamic> userDetailsfromfire = {
        'user_name': userDetails?.displayName,
        'photo_url': userDetails?.photoURL,
        'uid': userDetails?.uid,
        'email': userDetails?.email,
      };

      SharedPreferenceHelper().saveUserData(userDetailsfromfire);
      SharedPreferenceHelper().saveUserEmail(userDetails?.email);
      SharedPreferenceHelper().saveUserId(userDetails?.uid);
      SharedPreferenceHelper()
          .saveUserName(userDetails!.email?.replaceAll("@gmail.com", ""));
      SharedPreferenceHelper().saveDisplayName(userDetails.displayName ?? '');
      SharedPreferenceHelper().saveUserProfileUrl(userDetails.photoURL ?? '');
      //await Auth().login(userDetails.uid);
      // cUser = await UserController()
      //     .getUserById(userDetails.uid); //get all user data from backend
      //UserChangeNotifier().setCurrentUser = cUser!;
      //return cUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return e.code;
      } else if (e.code == 'wrong-password') {
        return e.code;
      } else {
        print(e.code);
        return 'error';
      }
    }
  }

//create new account
  createAccountWithFirebase(email, password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      print(userCredential);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.code == 'weak-password') {
        return e.code;
      } else if (e.code == 'email-already-in-use') {
        return e.code;
      } else {
        return 'error';
      }
    }
  }

//send verify mail
  emailVerified() async {
    User? user = firebaseAuth.currentUser;
    if (user!.emailVerified) {
      await user.sendEmailVerification();
    }
  }

//logout
  Future<void> userLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    await firebaseAuth.signOut();
  }

//current user id
  String? getCurrentUid() {
    if (firebaseAuth.currentUser != null) {
      print(firebaseAuth.currentUser?.uid);
      return firebaseAuth.currentUser!.uid;
    }
    return null;
  }

//current user
  getCurrentUser() {
    User? user = firebaseAuth.currentUser;
    if (user != null) {
      return user;
    }
    return null;
  }

//delete current user
  deleteUser() async {
    try {
      await firebaseAuth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        print(
            'The user must reauthenticate before this operation can be executed.');
      }
    }
  }

  //forget password
  forgetPassword(email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email).then((res) {
        return res;
      });
    } catch (e) {
      return e;
    }
  }

  //--------------------------------OAuth----------------------------------------//

  //google Sign in
  Future signInWithGoogle() async {
    var cUser;
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    print(credential);
    var userCredential = await firebaseAuth.signInWithCredential(credential);
    User? userDetails = userCredential.user;

    if (userCredential.additionalUserInfo!.isNewUser) {
      // cUser = await Auth().registerUser(userDetails, userDetails?.displayName);
    } else {
      // await Auth().login(userDetails?.uid).then((value) async {
      //   cUser = await UserController().getUserById(userDetails?.uid);
      // });
    }

    SharedPreferenceHelper().saveUserEmail(userDetails?.email);
    SharedPreferenceHelper().saveUserId(userDetails?.uid);
    SharedPreferenceHelper()
        .saveUserName(userDetails?.email?.replaceAll("@gmail.com", ""));
    SharedPreferenceHelper().saveDisplayName(userDetails?.displayName);
    SharedPreferenceHelper().saveUserProfileUrl(userDetails?.photoURL);
    return cUser;
  }

  Future signInWithApple() async {
    var cUser;

    final result = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    final appleIdCredential = result;
    final oAuthProvider = OAuthProvider('apple.com');
    final credential = oAuthProvider.credential(
      idToken: appleIdCredential.identityToken,
      accessToken: appleIdCredential.authorizationCode,
    );

    print(credential);
    var userCredential = await firebaseAuth.signInWithCredential(credential);
    User? userDetails = userCredential.user;

    if (userCredential.additionalUserInfo!.isNewUser) {
      //cUser = await Auth().registerUser(userDetails, userDetails?.displayName);
    } else {
      // await Auth().login(userDetails?.uid).then((value) async {
      //   cUser = await UserController().getUserById(userDetails?.uid);
      // });
    }

    SharedPreferenceHelper().saveUserEmail(userDetails?.email);
    SharedPreferenceHelper().saveUserId(userDetails?.uid);
    var name = userDetails?.email?.split('@');
    SharedPreferenceHelper().saveUserName(name![0]);
    //SharedPreferenceHelper().saveDisplayName(userDetails?.displayName);
    //SharedPreferenceHelper().saveUserProfileUrl(userDetails?.photoURL);
    return cUser;
  }
}
