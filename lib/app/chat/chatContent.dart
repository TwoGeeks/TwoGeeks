import 'package:flutter/material.dart';
import 'package:twoGeeks/animations/FadeAnimation.dart';
import 'package:twoGeeks/app/chat/eachChatView.dart';

Widget chatContent(context, userID, List idList, String type) {
  int _len = idList == null ? 0 : idList.length;
  return ListView.builder(
      itemCount: _len,
      itemBuilder: (BuildContext ctxt, int index) {
        double animationDelay = 1.3 + index / 10;
        return FadeAnimation(
            animationDelay, eachChatView(context, userID, idList[index], type));
      });
}
