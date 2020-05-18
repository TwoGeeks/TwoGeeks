import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twoGeeks/app/services/user.dart';
import 'package:twoGeeks/app/services/auth_base.dart';

class Auth implements AuthBase{

  final _firebaseAuth = FirebaseAuth.instance;
  // helper method to return User from firebase if valid
  // else return null
  User _userFromFirebase(FirebaseUser user){
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

  // sign in with google
  Future<User> signInWithGoogle() async {
    GoogleSignInAccount googleAccount = await GoogleSignIn().signIn();
    if (googleAccount != null) {
      GoogleSignInAuthentication authToken = await googleAccount.authentication;
      if (authToken.accessToken.isNotEmpty && authToken.idToken.isNotEmpty) {
        final authResult = await _firebaseAuth.signInWithCredential(
          GoogleAuthProvider.getCredential(idToken: authToken.idToken,
            accessToken: authToken.accessToken,),
        );
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

  // sign out
  @override
  Future<void> signOut() async {
    GoogleSignIn().signOut();
    await _firebaseAuth.signOut();
  }

  // returns current user
  @override
  Future<User> currentUser() async {
    return _userFromFirebase(await  _firebaseAuth.currentUser());
  }
}