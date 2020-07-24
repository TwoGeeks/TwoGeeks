import 'package:flutter/material.dart';
import 'package:twoGeeks/app/services/auth_base.dart';
import 'package:twoGeeks/app/settings/subSettingHeaders.dart';
import 'package:twoGeeks/app/sign_in/twogeeks_sign_in_form.dart';

class TwoGeeksSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f6f4),
      body: Column(
        children: <Widget>[
          subSettingHeader("Sign In", context),
          Expanded(
            child: TwoGeeksSignInForm(),
          ),
        ],
      ),
    );
  }
}
