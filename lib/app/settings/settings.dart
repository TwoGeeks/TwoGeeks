import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twoGeeks/Router/routing_constants.dart';
import 'package:twoGeeks/common_widgets/navBar.dart';
import 'package:twoGeeks/app/settings/setting_button.dart';
import 'package:twoGeeks/app/services/auth_base.dart';
import 'package:twoGeeks/common_widgets/platform_alert_dialog.dart';

class Settings extends StatelessWidget {

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
        final auth = Provider.of<AuthBase>(context,listen: false);
        await auth.signOut();
        Navigator.pushReplacementNamed(context, LandingRoute);
      } catch (e) {
        print("Error Encountered ${e.toString()}");
      }
    }

    Future<void> _confirmSignOut(BuildContext context) async {
      final requestSignOut = await PlatformAlertDialog(
        title: "Log Out",
        content: "Are you sure you want to log out?",
        defaultActionText: 'LogOut',
        cancelActionText: "Cancel",
      ).show(context);
      if (requestSignOut) {
        _signOut();
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
            onPressed: () => _confirmSignOut(context),
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
