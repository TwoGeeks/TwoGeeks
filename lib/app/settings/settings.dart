import 'package:flutter/material.dart';
import 'package:twoGeeks/Router/routing_constants.dart';
import 'package:twoGeeks/common_widgets/navBar.dart';
import 'package:twoGeeks/app/settings/setting_button.dart';
import 'package:twoGeeks/app/services/auth_base.dart';

class Settings extends StatelessWidget {
  // sign out
  Settings({this.auth});
  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(context),
      backgroundColor: Colors.white,
      bottomNavigationBar: navBar(context, 4),
    );
  }

  Widget _buildContent(BuildContext context) {
    // temporary method to sign in for testing
    Future<void> _signOut() async {
      try {
        await auth.signOut();
        Navigator.pushReplacementNamed(context, LandingRoute);
      } catch (e) {
        print("Error Encountered ${e.toString()}");
      }
    }

    return Padding(
      padding: EdgeInsets.only(top: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Container(
            color: Colors.grey[400],
            height: 40,
            alignment: Alignment.center,
            child: Text(
              "Settings",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          SettingButton(
            text: "Edit Profile",
            textColor: Colors.black,
            onPressed: () {},
            buttonColor: Colors.white,
          ),
          SettingButton(
            text: "Edit Preference",
            textColor: Colors.black,
            onPressed: () {},
            buttonColor: Colors.white,
          ),
          SettingButton(
            text: "Log Out",
            textColor: Colors.black,
            onPressed: _signOut,
            buttonColor: Colors.white,
          ),
          SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}
