import 'package:flutter/material.dart';
import 'package:twoGeeks/app/sign_in/sign_in_button.dart';
import 'package:twoGeeks/app/sign_in/sign_in_button_with_logo.dart';
import 'package:firebase_auth/firebase_auth.dart'

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
      Text(
          "Sign in to TwoGeeks",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 32,
          ),
        ),
        SizedBox(height: 80,),
        SignInButtonWithLogo(
          text: "Sign in with Google",
          assetName: "images/google-logo.png",
          textColor: Colors.red[800],
          buttonColor: Colors.white,
          onPressed: () {},
        ),
        SizedBox(height: 10.0,),
        SignInButtonWithLogo(
          text: "Sign in with Facebook",
          assetName: "images/facebook-logo.png",
          textColor: Colors.white,
          buttonColor: Color(0xFF334D92),
          onPressed: () {},
        ),
        SizedBox(height: 10.0,),
        SignInButton(
          text: "Sign in with TwoGeeks",
          textColor: Colors.white,
          buttonColor: Colors.purple[700],
          onPressed: () {},
        ),
        SizedBox(height: 10.0,),
        Text(
          'or',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 14,
              color: Colors.black87
          ),
        ),
        SizedBox(height: 10.0,),
        InkWell(
          child: Text(
            "Create a new TwoGeeks Account",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w500,
              fontSize: 16,
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    ),
  );
}
