import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:twoGeeks/app/services/database.dart';
import 'package:twoGeeks/common_widgets/platform_exception_alert_dialog.dart';

/* Edit User Profile */

class UserProfile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit User Profile"),
        elevation: 3.0,
      ),
      body: ListView(),
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
    return ListView(
      children: <Widget>[

      ],
    );
  }
}
