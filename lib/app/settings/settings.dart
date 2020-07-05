import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twoGeeks/Router/routing_constants.dart';
import 'package:twoGeeks/animations/FadeAnimation.dart';
import 'package:twoGeeks/app/services/database.dart';
import 'package:twoGeeks/app/services/user.dart';
import 'package:twoGeeks/common_widgets/navBar.dart';
import 'package:twoGeeks/app/settings/setting_button.dart';
import 'package:twoGeeks/app/services/auth_base.dart';
import 'package:twoGeeks/common_widgets/platform_alert_dialog.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Database database;

  void _getUid() async {
    final auth = Provider.of<AuthBase>(context, listen: false);
    User user = await auth.currentUser();
    if (mounted) {
      setState(() {
        database = FireStoreDatabase(uid: user.uid);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(context),
      backgroundColor: Colors.white,
      bottomNavigationBar: navBar(context, 4),
    );
  }

  Widget _buildContent(BuildContext context) {
    _getUid();
    Future<void> _signOut() async {
      try {
        final auth = Provider.of<AuthBase>(context, listen: false);
        await auth.signOut();
        Navigator.pushReplacementNamed(context, LandingRoute);
      } catch (e) {
        print("Error Encountered ${e.toString()}");
      }
    }

    Future<void> _confirmSignOut(BuildContext context) async {
      final requestSignOut = await PlatformAlertDialog(
        title: "Log Out",
        content: Text("Are you sure you want to log out?"),
        defaultActionText: 'LogOut',
        cancelActionText: "Cancel",
      ).show(context);
      if (requestSignOut) {
        _signOut();
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        FadeAnimation(
          0.8,
          Container(
            height: 100,
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                color: Color(0xffb9789f),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Text(
              "Settings",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 30,
                letterSpacing: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        FadeAnimation(
          0.9,
          SettingButton(
            text: "Edit Profile",
            textColor: Colors.black,
            onPressed: () => Navigator.pushNamed(context, UserProfileRoute),
            buttonColor: Colors.white,
          ),
        ),
        FadeAnimation(
          1,
          SettingButton(
            text: "Edit Preference",
            textColor: Colors.black,
            onPressed: () => Navigator.pushNamed(context, UserPreferenceRoute),
            buttonColor: Colors.white,
          ),
        ),
        StreamBuilder(
            stream: database.getUserProfile(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                bool tutor = snapshot.data.tutor;
                return SettingButton(
                  text: tutor ? "Disable Tutor" : "Enable Tutor",
                  textColor: Colors.black,
                  onPressed: () async {
                    await database.updateProfile("tutor", !tutor);
                  },
                  buttonColor: Colors.white,
                );
              }
            }),
        FadeAnimation(
          1.1,
          SettingButton(
            text: "Log Out",
            textColor: Colors.black,
            onPressed: () => _confirmSignOut(context),
            buttonColor: Colors.white,
          ),
        ),
        SizedBox(
          height: 80,
        ),
      ],
    );
  }
}
