import 'package:flutter/material.dart';
import 'package:twoGeeks/app/settings_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Two Geeks'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              "settings",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingPage()),);
            }
          )
        ],
      ),
    );
  }
}
