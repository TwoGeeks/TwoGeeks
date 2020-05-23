import 'package:flutter/material.dart';
import 'package:twoGeeks/app/detail/detailInfo/infoTitle.dart';

Widget aboutMe() {
  return Container(
    padding: EdgeInsets.all(10.0),
    margin: EdgeInsets.symmetric(vertical: 20.0),
    decoration: BoxDecoration(
        color: Colors.grey, borderRadius: BorderRadius.circular(10.0)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        infoTitle("About me"),
        Text(
            "Hello i am from somewehre and osmewhere, I like math and stuff bla bla bla. I jus gana fill this space up with random words so dont mind me!")
      ],
    ),
  );
}
