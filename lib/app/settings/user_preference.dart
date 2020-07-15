import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:twoGeeks/app/models/user_model.dart';
import 'package:twoGeeks/app/services/auth_base.dart';
import 'package:twoGeeks/app/services/database.dart';
import 'package:twoGeeks/app/services/user.dart';
import 'package:twoGeeks/app/settings/education_levels.dart';
import 'package:twoGeeks/app/settings/subSettingHeaders.dart';
import 'package:twoGeeks/common_widgets/platform_exception_alert_dialog.dart';
import 'package:twoGeeks/app/settings/custom_dropdown_tile.dart';

/* Edit User Profile */
class UserPreference extends StatefulWidget {
  @override
  _UserPreferenceState createState() => _UserPreferenceState();
}

class _UserPreferenceState extends State<UserPreference> {
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
      backgroundColor: Color(0xfff0f6f4),
      body: Column(
        children: <Widget>[
          subSettingHeader("Edit User Preference", context),
          _buildUserProfileForm(),
        ],
      ),
    );
  }

  void _updatePreferredGrade(String grade) async {
    try {
      await database.updateProfile("preferredCurrentSchoolYear", grade);
    } on PlatformException catch (e) {
      PlatformExceptionAlertDialog(
        title: "Opps! Something went wrong..",
        exception: e,
      ).show(context);
    }
  }

  void _updatePreferredGender(String gender) async {
    try {
      await database.updateProfile("preferredGender", gender);
    } on PlatformException catch (e) {
      PlatformExceptionAlertDialog(
        title: "Opps! Something went wrong..",
        exception: e,
      ).show(context);
    }
  }

  Widget _buildUserProfileForm() {
    _getUid();
    return StreamBuilder<UserModel>(
        stream: database.getUserProfile(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Expanded(
              child: ListView(
                children: <Widget>[
                  CustomDropdownTile(
                    title: "Gender",
                    subtitle: snapshot.data.userPreference.gender,
                    list: ["neutral", "male", "female"],
                    onSubmit: _updatePreferredGender,
                  ),
                  CustomDropdownTile(
                    title: "Current School Year",
                    subtitle: snapshot.data.userPreference.currentSchoolYear,
                    list: EducationLevel.education,
                    onSubmit: _updatePreferredGrade,
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
