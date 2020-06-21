import 'package:flutter/material.dart';
import 'package:twoGeeks/app/services/auth_base.dart';
import 'package:twoGeeks/app/sign_in/twogeeks_sign_in_form.dart';

class TwoGeeksSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign in with TwoGeeks"),
        elevation: 3.0,
      ),
      body: TwoGeeksSignInForm(),
    );
  }
}
