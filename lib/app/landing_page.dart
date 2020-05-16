import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twoGeeks/app/sign_in/sign_in_page.dart';
import 'package:twoGeeks/app/home_page.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  FirebaseUser _user;

  @override
  void initState() {
    super.initState();
    _initialiseUser();
  }

  // initialise the user when user opens up the app to check
  // if user was previously signed in
  Future<void> _initialiseUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    _updateUser(user);
  }

  void _updateUser(FirebaseUser user) {
    setState(() {
        _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(_user == null) {
      return SignInPage(
        onSignIn: _updateUser,
      );
    }
    return HomePage(
      onSignOut: () => _updateUser(null),
    );
  }
}

