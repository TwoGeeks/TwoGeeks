import 'package:flutter/material.dart';
import 'package:twoGeeks/app/services/auth_base.dart';
import 'package:twoGeeks/app/sign_in/twogeeks_sign_in_form.dart';

class TwoGeeksSignInPage extends StatelessWidget {

  TwoGeeksSignInPage({@required this.auth,});
  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign in with TwoGeeks"),
        elevation: 3.0,
      ),
      body: SingleChildScrollView(
        child: TwoGeeksSignInForm(auth: auth,),
      ),
    );
  }
}