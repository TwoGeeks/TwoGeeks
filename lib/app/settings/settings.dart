import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twoGeeks/Router/routing_constants.dart';
import 'package:twoGeeks/animations/FadeAnimation.dart';
import 'package:twoGeeks/app/services/database.dart';
import 'package:twoGeeks/app/services/user.dart';
import 'package:twoGeeks/app/settings/settingHeader.dart';
import 'package:twoGeeks/app/settings/tutor_profile.dart';
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
      backgroundColor: Color(0xfff0f6f4),
      bottomNavigationBar: navBar(context, 4),
    );
  }

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
      title: Text("Log Out"),
      content: Text("Are you sure you want to log out?"),
      defaultActionText: 'LogOut',
      cancelActionText: "Cancel",
    ).show(context);
    if (requestSignOut) {
      _signOut();
    }
  }

  Widget _buildContent(BuildContext context) {
    _getUid();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        FadeAnimation(0.8, settingHeader()),
        SizedBox(
          height: 40,
        ),
        FadeAnimation(
          0.9,
          SettingButton(
            text: "Edit Profile",
            textColor: Colors.black,
            onPressed: () => Navigator.pushNamed(context, UserProfileRoute),
          ),
        ),
        FadeAnimation(
          1,
          SettingButton(
            text: "Edit Tutor profile",
            textColor: Colors.black,
            onPressed: () => Navigator.pushNamed(context, TutorProfileRoute, arguments: database),
          ),
        ),
        FadeAnimation(
          1,
          SettingButton(
            text: "Edit Preference",
            textColor: Colors.black,
            onPressed: () => Navigator.pushNamed(context, UserPreferenceRoute),
          ),
        ),
        FadeAnimation(
          1.1,
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
                    buttonColor: Colors.grey.withOpacity(0.3),
                    onPressed: () async {
                      await database.updateProfile("tutor", !tutor);
                    },
                  );
                }
              }),
        ),
        FadeAnimation(
          1.2,
          SettingButton(
            text: "Log Out",
            textColor: Colors.black,
            onPressed: () => _confirmSignOut(context),
          ),
        ),
        SizedBox(
          height: 80,
        ),
      ],
    );
  }
}
