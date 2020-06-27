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
import 'package:twoGeeks/app/settings/edit_tile.dart';

/* Edit User Profile */
class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  String currentUserUid;

  void _getUid() async{
    final auth = Provider.of<AuthBase>(context, listen: false);
    User user = await auth.currentUser();
    if (mounted) {
      setState(() {
        currentUserUid = user.uid;
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

  void _addHobby(BuildContext context, String hobby) {
    try{
      final database = Provider.of<Database>(context, listen: false);
      database.addHobby(hobby);
    } on PlatformException catch(e) {
      PlatformExceptionAlertDialog(
        title: "Opps! Something went wrong..",
        exception: e,
      ).show(context);
    }
  }


  Widget _buildUserProfileForm(){
    _getUid();
    final database = FireStoreDatabase(uid: currentUserUid);
    return StreamBuilder<UserProfileModel>(
      stream: database.getUserProfile(),
      builder: (context, snapshot){
        if (snapshot.hasData){
            return ListView(
                children: <Widget>[
                  EditTile(
                    title: "Name",
                    subtitle: snapshot.data.name,
                    onTap: () => (){},
                  ),
                  EditTile(
                    title: "Age",
                    subtitle: snapshot.data.age,
                    onTap: () => (){},
                  ),
                  EditTile(
                    title: "Country",
                    subtitle: snapshot.data.country,
                    onTap: () => (){},
                  ),
                  EditTile(
                    title: "Current School",
                    subtitle: snapshot.data.currentSchool,
                    onTap: () => (){},
                  ),
                  EditTile(
                    title: "Current School Year",
                    subtitle: snapshot.data.currentSchoolYear,
                    onTap: () => (){},
                  ),
                  EditTile(
                    title: "About me",
                    subtitle: snapshot.data.aboutMe,
                    onTap: () => (){},
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
