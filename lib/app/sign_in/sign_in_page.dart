import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twoGeeks/Router/routing_constants.dart';
import 'package:twoGeeks/app/sign_in/sign_in_button.dart';
import 'package:twoGeeks/app/sign_in/sign_in_button_with_logo.dart';
import 'package:twoGeeks/app/services/auth_base.dart';

class SignInPage extends StatelessWidget {

  // sign in with google
  Future<void> _signInWithGoogle(BuildContext context) async {
    final auth = Provider.of<AuthBase>(context,listen: false);
    try {
      await auth.signInWithGoogle();
    } catch (e) {
      print("Error Encountered ${e.toString()}");
    }
  }

  // sign in with facebook
  Future<void> _signInWithFacebook(BuildContext context) async {
    final auth = Provider.of<AuthBase>(context,listen: false);
    try {
      await auth.signInWithFacebook();
    } catch (e) {
      print("Error Encountered ${e.toString()}");
    }
  }

  // sign in with TwoGeeks
  void _signInWithTwoGeeks(BuildContext context) async {
    Navigator.of(context).pushNamed(TwoGeeksSignInRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/study.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: _buildContent(context), /* add child content here */
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Sign in to TwoGeeks",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 32,
            ),
          ),
          SizedBox(
            height: 80,
          ),
          SignInButton(
            text: "Sign in with TwoGeeks",
            textColor: Colors.white,
            buttonColor: Colors.purple[700],
            onPressed: () => _signInWithTwoGeeks(context),
          ),
          SizedBox(
            height: 10.0,
          ),
          SignInButtonWithLogo(
            text: "Sign in with Facebook",
            assetName: "images/facebook-logo.png",
            textColor: Colors.white,
            buttonColor: Color(0xFF334D92),
            onPressed: () => _signInWithFacebook(context),
          ),
          SizedBox(
            height: 10.0,
          ),
          SignInButtonWithLogo(
            text: "Sign in with Google",
            assetName: "images/google-logo.png",
            textColor: Colors.red[800],
            buttonColor: Colors.white,
            onPressed: () => _signInWithGoogle(context),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'or',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
          SizedBox(
            height: 10.0,
          ),
          FlatButton(
            child: Text(
              "Create a new TwoGeeks Account",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                decoration: TextDecoration.underline,
              ),
            ),
            onPressed: () => Navigator.of(context).pushNamed("Signup"),
          )
        ],
      ),
    );
  }
}
