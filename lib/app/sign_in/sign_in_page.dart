import 'package:flutter/material.dart';
import 'package:twoGeeks/app/sign_in/sign_in_button.dart';


class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TwoGeeks"),
        elevation: 3.0,
      ),
      body: _buildContent(),
      backgroundColor: Colors.grey[200],
    );
  }
}

Widget _buildContent() {
  return Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SignInButton(
          text: "Sign in with Facebook",
          textColor: Colors.blue[800],
          buttonColor: Colors.grey[200],
          onPressed: () {},
        ),
        SizedBox(
          height: 8.0,
        ),
      ],
    ),
  );
}
