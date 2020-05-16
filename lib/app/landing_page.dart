import 'package:flutter/material.dart';
import 'package:twoGeeks/app/sign_in/sign_in_page.dart';
import 'package:twoGeeks/app/home_page.dart';
import 'package:twoGeeks/app/services/user.dart';
import 'package:twoGeeks/app/services/auth_base.dart';

class LandingPage extends StatefulWidget {
  final AuthBase auth;
  LandingPage({this.auth});

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  User _user;

  @override
  void initState() {
    super.initState();
    _initialiseUser();
  }

  // initialise the user when user opens up the app to check
  // if user was previously signed in
  Future<void> _initialiseUser() async {
    User user = await widget.auth.currentUser();
    _updateUser(user);
  }

  void _updateUser(User user) {
    setState(() {
        _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(_user == null) {
      return SignInPage(
        auth: widget.auth,
        onSignIn: _updateUser,
      );
    }
    return HomePage(
      auth: widget.auth,
      onSignOut: () => _updateUser(null),
    );
  }
}

