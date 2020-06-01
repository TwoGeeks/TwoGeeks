import 'package:twoGeeks/app/services/user.dart';

// abstract class for all auth methods
abstract class AuthBase {

  // check if auth state is changed
  Stream<User> get onAuthStateChanged;
  // sign in anonymously
  Future<User> signInAnonymously();
  // sign out
  Future<void> signOut();
  // current user
  Future<User> currentUser();
  // sign up
  Future<User> signUpWithTwoGeeks(email, password);
  // sign in via google
  Future<User> signInWithGoogle();
  // sign in via facebook
  Future<User> signInWithFacebook();
  // sign in via TwoGeeks
  Future<User> signInWithTwoGeeks(email, password);
  // check if new user
  Future<void> checkUserExist(uid);
}