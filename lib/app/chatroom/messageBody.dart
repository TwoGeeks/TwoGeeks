import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twoGeeks/app/chatroom/friendChat.dart';
import 'package:twoGeeks/app/chatroom/userChat.dart';

Widget messageBody(context, List<DocumentSnapshot> listMessage, String userID,
    listScrollController) {
  return (ListView.builder(
      controller: listScrollController,
      reverse: true,
      itemCount: listMessage.length,
      itemBuilder: (BuildContext ctxt, int index) {
        DocumentSnapshot doc = listMessage[index];
        if (userID == doc["idFrom"]) {
          return userChat(context, doc);
        } else {
          return friendChat(context, doc);
        }
      }));
}
