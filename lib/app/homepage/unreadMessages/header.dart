import 'package:flutter/material.dart';

Widget header() {
  return Container(
    padding: EdgeInsets.only(left: 30),
    margin: EdgeInsets.only(top: 40),
    child: Row(
      children: <Widget>[
        Text(
          "Unread Messages",
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
        ),
        Icon(
          Icons.mail,
          size: 30,
        )
      ],
    ),
  );
}
