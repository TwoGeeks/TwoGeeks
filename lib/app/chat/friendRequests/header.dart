import 'package:flutter/material.dart';

Widget header() {
  return Container(
    padding: EdgeInsets.only(left: 30),
    margin: EdgeInsets.only(bottom: 20, top: 10),
    child: Row(
      children: <Widget>[
        Text(
          "Friend Requests",
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
        ),
        Icon(
          Icons.person_add,
          size: 30,
        )
      ],
    ),
  );
}
