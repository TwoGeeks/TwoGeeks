import 'package:flutter/material.dart';
import 'package:twoGeeks/app/chat/eachChatView.dart';
import 'package:twoGeeks/app/homepage/unreadMessages/header.dart';

Widget unreadMessages(context) {
  return Expanded(
    child: Column(
      children: <Widget>[
        header(),
        Expanded(
          child: ListView.builder(
              padding: EdgeInsets.only(left: 20),
              itemCount: 13,
              itemBuilder: (BuildContext ctxt, int index) {
                return eachChatView(context);
              }),
        ),
      ],
    ),
  );
}
