import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:twoGeeks/app/models/user_profile_model.dart';
import 'package:twoGeeks/app/services/auth_base.dart';
import 'package:twoGeeks/app/services/database.dart';
import 'package:twoGeeks/app/services/user.dart';
import 'package:twoGeeks/common_widgets/platform_exception_alert_dialog.dart';
import 'package:twoGeeks/app/settings/edit_text_tile.dart';

/* Edit User Profile */
class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  String currentUserUid;
  Database database;

  void _getUid() async{
    final auth = Provider.of<AuthBase>(context, listen: false);
    User user = await auth.currentUser();
    if (mounted) {
      setState(() {
        currentUserUid = user.uid;
        database = FireStoreDatabase(uid: currentUserUid);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit User Profile"),
        elevation: 3.0,
      ),
      body: _buildUserProfileForm(),
    );
  }

  void _updateName(String name) async{
    try{
      await database.updateProfile("name", name);
    } on PlatformException catch(e) {
      PlatformExceptionAlertDialog(
        title: "Opps! Something went wrong..",
        exception: e,
      ).show(context);
    }
  }
  void _updateAboutMe(String aboutMe) async{
    try{
      await database.updateProfile("aboutMe", aboutMe);
    } on PlatformException catch(e) {
      PlatformExceptionAlertDialog(
        title: "Opps! Something went wrong..",
        exception: e,
      ).show(context);
    }
  }



  Widget _buildUserProfileForm(){
    _getUid();
    return StreamBuilder<UserProfileModel>(
      stream: database.getUserProfile(),
      builder: (context, snapshot){
        if (snapshot.hasData){
            return ListView(
                children: <Widget>[
                  EditTextTile(
                    title: "Name",
                    subtitle: snapshot.data.name,
                    onSubmit: _updateName,
                    maxLength: 35,
                    maxLines: 1,
                  ),
                  EditTextTile(
                    title: "Age",
                    subtitle: snapshot.data.age.toString(),
                  ),
                  EditTextTile(
                    title: "Country",
                    subtitle: snapshot.data.country,
                  ),
                  EditTextTile(
                    title: "Current School",
                    subtitle: snapshot.data.currentSchool,
                  ),
                  EditTextTile(
                    title: "Current School Year",
                    subtitle: snapshot.data.currentSchoolYear,
                  ),
                  EditTextTile(
                    title: "About me",
                    subtitle: snapshot.data.aboutMe,
                    onSubmit: _updateAboutMe,
                    maxLength: 140,
                    maxLines: 6,
                  ),
                ],
            );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }
    );
  }
}
