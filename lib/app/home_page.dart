import 'package:flutter/material.dart';
import 'package:twoGeeks/app/services/auth_base.dart';
import 'package:twoGeeks/common_widgets/NavBar.dart';

class HomePage extends StatelessWidget {

  // sign out
  HomePage({this.auth,});
  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Two Geeks'),
      ),
      body: Column(
        children: <Widget>[
        ],
      ),
      bottomNavigationBar: NavBar(context, 2),
    );
  }
}

