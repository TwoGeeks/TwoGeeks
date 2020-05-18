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
  // sign in via google
  Future<User> signInWithGoogle();
  // sign in via facebook
  // sign in via TwoGeeks
}