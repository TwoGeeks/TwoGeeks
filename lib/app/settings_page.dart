import 'package:flutter/material.dart';
import 'package:twoGeeks/common_widgets/custom_flat_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Settings extends StatelessWidget {

  // sign out
  Settings({@required this.onSignOut});
  final VoidCallback onSignOut;

  // temporary method to sign in for testing
  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      onSignOut();
    } catch (e) {
      print("Error Encountered ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        elevation: 3.0,
      ),
      body: _buildContent(),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _SignOutButton(),
          SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }

  Widget _SignOutButton() {
    return CustomFlatButton(
      child: Text(
        "Logout",
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
      ),
      height: 50,
      color: Colors.red[600],
      onPressed: _signOut,
    );
  }
}
