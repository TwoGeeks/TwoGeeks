import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twoGeeks/app/sign_in/sign_in_page.dart';
import 'package:twoGeeks/app/homepage/home_page.dart';
import 'package:twoGeeks/app/services/user.dart';
import 'package:twoGeeks/app/services/auth_base.dart';

class LandingPage extends StatelessWidget {
  final AuthBase auth;
  LandingPage({this.auth});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: auth.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User user = snapshot.data;
          if (user == null) {
            return SignInPage(
              auth: auth,
            );
          }
          return HomePage(
            auth: auth,
          );
        } else {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "TwoGeeks",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.purple[600],
                    fontSize: 35,
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey[400],
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
