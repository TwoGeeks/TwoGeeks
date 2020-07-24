import 'package:flutter/material.dart';
import 'package:twoGeeks/app/services/auth_base.dart';
import 'package:twoGeeks/app/settings/subSettingHeaders.dart';
import 'package:twoGeeks/app/sign_up/sign_up_form.dart';

class TwoGeeksSignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f6f4),
      body: Column(
        children: <Widget>[
          subSettingHeader("Sign up", context),
          Expanded(child: TwoGeeksSignUpForm()),
        ],
      ),
    );
  }
}
