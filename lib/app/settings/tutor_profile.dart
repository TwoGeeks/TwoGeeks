import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:twoGeeks/app/models/user_model.dart';
import 'package:twoGeeks/app/services/auth_base.dart';
import 'package:twoGeeks/app/services/database.dart';
import 'package:twoGeeks/app/services/user.dart';
import 'package:twoGeeks/app/settings/edit_array_dropdown_tile.dart';
import 'package:twoGeeks/app/settings/edit_array_tile.dart';
import 'package:twoGeeks/app/settings/education_levels.dart';
import 'package:twoGeeks/app/settings/subSettingHeaders.dart';
import 'package:twoGeeks/common_widgets/platform_exception_alert_dialog.dart';

class TutorProfile extends StatefulWidget {

  @override
  _TutorProfileState createState() => _TutorProfileState();
}

class _TutorProfileState extends State<TutorProfile> {

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
          subSettingHeader("Edit Tutor Profile", context),
          _buildUserProfileForm(),
        ],
      ),
    );
  }

  void _updateTutoringSubjects(List<dynamic> newSubjects) async {
    try {
      await database.updateProfile("tutoringSubjects", newSubjects);
    } on PlatformException catch (e) {
      PlatformExceptionAlertDialog(
        title: "Opps! Something went wrong..",
        exception: e,
      ).show(context);
    }
  }
  void _updateTutoringGrades(List<dynamic> newGrades) async {
    try {
      await database.updateProfile("tutoringGrades", newGrades);
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
                  EditArrayTile(
                    title: "Tutoring Subjects",
                    helperText: "eg. mathematics",
                    array: snapshot.data.tutoringSubjects,
                    onSubmit: _updateTutoringSubjects,
                  ),
                  EditArrayDropdownTile(
                    title: "Tutoring Level",
                    helperText: "eg. mathematics",
                    suggestions: EducationLevel.education,
                    array: snapshot.data.tutoringGrades,
                    onSubmit: _updateTutoringGrades,
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
