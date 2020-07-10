import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twoGeeks/app/chat/chatHeader/searchBar.dart';

Widget chatHeader(bool tutor) {
  return Stack(children: <Widget>[
    Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 30, top: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              tutor ? "Students" : "Friends",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2.5,
              ),
            ),
          ),
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(80)),
              gradient: LinearGradient(
                  colors: [Color(0xff2dbde8), Color(0xff0070a5)],
                  begin: Alignment.topLeft)),
        ),
        Container(
          color: Color(0xff2dbde8),
          height: 30,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40)),
                color: Color(0xfff0f6f4)),
            height: 50,
          ),
        ),
      ],
    ),
    Align(
      alignment: Alignment.bottomRight,
      child: Container(
          margin: EdgeInsets.only(top: 30, left: 30, right: 30),
          height: 130,
          width: 130,
          child: SvgPicture.asset("images/friends.svg")),
    ),
  ]);
}
