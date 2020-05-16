import 'package:flutter/material.dart';
import 'package:twoGeeks/app/services/auth_base.dart';
import 'package:twoGeeks/app/settings/settings_page.dart';
import 'package:twoGeeks/common_widgets/NavBar.dart';

class HomePage extends StatelessWidget {

  // sign out
  HomePage({@required this.auth, @required this.onSignOut});
  final VoidCallback onSignOut;
  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    Settings(auth: auth, onSignOut: () => onSignOut(),);
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
