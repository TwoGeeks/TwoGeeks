import 'package:flutter/material.dart';
import 'package:twoGeeks/app/chat/eachChatView.dart';

Widget chatContent(context) {
  return (ListView.builder(
      itemCount: 13,
      itemBuilder: (BuildContext ctxt, int index) {
        return eachChatView(context);
      }));
}
