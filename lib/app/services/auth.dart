import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twoGeeks/app/services/user.dart';
import 'package:twoGeeks/app/services/auth_base.dart';

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;
  // helper method to return User from firebase if valid
  // else return null
  User _userFromFirebase(FirebaseUser user) {
    if (user == null) {
      return null;
    }
    return User(uid: user.uid);
  }

  @override
  Stream<User> get onAuthStateChanged {
    return _firebaseAuth.onAuthStateChanged.map(_userFromFirebase);
  }

  // anonymous sign in
  @override
  Future<User> signInAnonymously() async {
    AuthResult result = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(result.user);
  }

  @override
  // sign in with google
  Future<User> signInWithGoogle() async {
    GoogleSignInAccount googleAccount = await GoogleSignIn().signIn();
    if (googleAccount != null) {
      GoogleSignInAuthentication authToken = await googleAccount.authentication;
      if (authToken.accessToken.isNotEmpty && authToken.idToken.isNotEmpty) {
        final authResult = await _firebaseAuth.signInWithCredential(
          GoogleAuthProvider.getCredential(
            idToken: authToken.idToken,
            accessToken: authToken.accessToken,
          ),
        );

        await checkUserExist(authResult.user.uid);
        return _userFromFirebase(authResult.user);
      } else {
        throw PlatformException(
          code: "MISSING_GOOGLE_AUTH_TOKEN",
          message: "google auth token missing",
        );
      }
    } else {
      throw PlatformException(
        code: "ERROR_ABORTED_BY_USER",
        message: "sign in aborted by user",
      );
    }
  }

  @override
  Future<User> signInWithFacebook() async {
    final result = await FacebookLogin().logIn(['public_profile']);
    if (result.accessToken.isValid()) {
      final authResult = await _firebaseAuth.signInWithCredential(
        FacebookAuthProvider.getCredential(
          accessToken: result.accessToken.token,
        ),
      );

      await checkUserExist(authResult.user.uid);
      return _userFromFirebase(authResult.user);
    } else {
      throw PlatformException(
        code: "ERROR_ABORTED_BY_USER",
        message: "sign in aborted by user",
      );
    }
  }

  @override
  Future<User> signInWithTwoGeeks(email, password) async {
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<User> signUpWithTwoGeeks(email, password) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    await checkUserExist(authResult.user.uid);
    return _userFromFirebase(authResult.user);
  }

  // sign out
  @override
  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FacebookLogin().logOut();
    await _firebaseAuth.signOut();
  }

  // returns current user
  @override
  Future<User> currentUser() async {
    return _userFromFirebase(await _firebaseAuth.currentUser());
  }

  @override
  Future<void> checkUserExist(uid) async {
    final Firestore _db = Firestore.instance;
    _db.collection("users").document("$uid").get().then((value) async {
      if (value.data == null) {
        // add new user
        await _db.collection("users").document('$uid').setData({
          'name': "",
          'age': 0,
          'currentSchool': '',
          'currentSchoolYear': '',
          'aboutMe': '',
          'gender': '',
          'profilePic': '',
          'statement': '',
          'hobbies': [],
          'strength': [],
          'weakness': [],
          'friends_user_uid': [],
          'friendrequest_user_uid': [],
        });

//        _db.collection("users").document('$uid/preferences/${uid}').setData({
//          'ageLower': 0,
//          'ageUpper': 0,
//          'currentSchoolYear': '',
//          'gender': '',
//          'location': '',
//        });

//        _db.collection("users").document('$uid/friends/$uid').setData({
//          'user_uid': [],
//        });
//
//        _db.collection("users").document('$uid/friendRequests/$uid').setData({
//          'user_uid': [],
//        });
      }
    });
  }
}
