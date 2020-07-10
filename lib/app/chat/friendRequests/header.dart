import 'package:flutter/material.dart';

Widget header(bool tutor) {
  return Container(
    padding: EdgeInsets.only(left: 30),
    margin: EdgeInsets.only(bottom: 20, top: 10),
    child: Row(
      children: <Widget>[
        Text(
          tutor ? "Student Requests" : "Friend Requests",
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
