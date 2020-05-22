import 'package:flutter/material.dart';
import 'package:twoGeeks/app/homepage/friendRequests/friendRequests.dart';
import 'package:twoGeeks/app/homepage/unreadMessages/unreadMessages.dart';
import 'package:twoGeeks/app/services/auth_base.dart';
import 'package:twoGeeks/common_widgets/NavBar.dart';

class HomePage extends StatelessWidget {
  // sign out
  HomePage({
    this.auth,
  });
  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          unreadMessages(context),
          Divider(
            color: Colors.black,
            thickness: 1,
            indent: 50,
            endIndent: 50,
          ),
          friendRequests(context),
        ],
      ),
      bottomNavigationBar: NavBar(context, 2),
    );
  }
}