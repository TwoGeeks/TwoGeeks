import 'package:firebase_auth/firebase_auth.dart';
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

  // anonymous sign in
  @override
  Future<User> signInAnonymously() async {
      AuthResult result = await _firebaseAuth.signInAnonymously();
      return _userFromFirebase(result.user);
  }

  // sign out
  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  // returns current user
  @override
  Future<User> currentUser() async {
    return _userFromFirebase(await  _firebaseAuth.currentUser());
  }
}