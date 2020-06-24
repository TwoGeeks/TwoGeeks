import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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

  Widget _buildUserProfileForm(){
    return ListView(
      children: <Widget>[

      ],
    );
  }
}
