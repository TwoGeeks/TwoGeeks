import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twoGeeks/app/chat/eachChatView.dart';

Widget chatContent(context, userID) {
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
          return (ListView.builder(
              itemCount: friendList.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return eachChatView(context, userID, friendList[index]);
              }));
        }
      });
}
