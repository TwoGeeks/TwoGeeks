import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twoGeeks/animations/FadeAnimation.dart';
import 'package:twoGeeks/app/chat/eachChatView.dart';

Widget chatContent(context, userID, String type) {
  return StreamBuilder(
      stream:
      Firestore.instance.collection("users").document(userID).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          DocumentSnapshot userData = snapshot.data;
          List<dynamic> friendList = userData["friends_user_uid"];
          int _len = friendList == null ? 0 : friendList.length;
          return (ListView.builder(
              itemCount: _len,
              itemBuilder: (BuildContext ctxt, int index) {
                double animationDelay = 1.3 + index / 10;
                return FadeAnimation(animationDelay,
                    eachChatView(context, userID, friendList[index], type));
              }));
        }
      });
}
