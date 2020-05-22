import 'package:flutter/material.dart';
import 'package:twoGeeks/app/chat/chatHeader/searchBar.dart';

Widget chatHeader(context) {
  return AppBar(
    backgroundColor: Colors.white,
    title: searchBar(context),
    bottom: PreferredSize(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(30, 4, 0, 4),
              color: Color.fromRGBO(174, 74, 203, 0.3),
              child: Text(
                "YOUR FRIENDS",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        preferredSize: Size.fromHeight(20)),
  );
}
