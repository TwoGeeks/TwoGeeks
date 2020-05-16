import 'package:flutter/material.dart';
import 'file:///C:/Users/Austi/Desktop/GitHub/TwoGeeks/lib/app/settings/settings_page.dart';
import 'package:twoGeeks/common_widgets/NavBar.dart';

class HomePage extends StatelessWidget {

  // sign out
  HomePage({@required this.onSignOut});
  final VoidCallback onSignOut;

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
