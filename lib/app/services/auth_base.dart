import 'package:twoGeeks/app/services/user.dart';

// abstract class for all auth methods
abstract class AuthBase {
  // sign in anonymously
  Future<User> signInAnonymously();
  // sign out
  Future<void> signOut();
  // current user
  Future<User> currentUser();
  // sign up
  // sign in via google
  // sign in via facebook
  // sign in via TwoGeeks
}