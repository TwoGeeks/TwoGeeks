import 'package:flutter/material.dart';
import 'package:twoGeeks/common_widgets/NavBar.dart';
import 'package:twoGeeks/common_widgets/custom_flat_button.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(),
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: NavBar(context, 4),
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
  onPressed: (){},
  );
}