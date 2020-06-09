import 'package:flutter/material.dart';
import 'package:twoGeeks/app/services/auth_base.dart';
import 'package:twoGeeks/app/sign_up/sign_up_form.dart';

class TwoGeeksSignUpPage extends StatelessWidget {

  TwoGeeksSignUpPage({@required this.auth,});
  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up with TwoGeeks"),
        elevation: 3.0,
      ),
      body: SingleChildScrollView(
        child: TwoGeeksSignUpForm(auth: auth,),
      ),
    );
  }
}
