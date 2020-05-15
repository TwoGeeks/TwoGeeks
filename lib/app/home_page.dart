import 'package:flutter/material.dart';
import 'package:twoGeeks/app/settings_page.dart';
import 'package:twoGeeks/common_widgets/NavBar.dart';

class HomePage extends StatelessWidget {
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
