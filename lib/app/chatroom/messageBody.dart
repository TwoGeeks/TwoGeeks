import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twoGeeks/animations/FadeAnimation.dart';
import 'package:twoGeeks/app/chatroom/friendChat.dart';
import 'package:twoGeeks/app/chatroom/userChat.dart';

Widget messageBody(context, List<DocumentSnapshot> listMessage, String userID,
    listScrollController, store) {
  return (ListView.builder(
      controller: listScrollController,
      reverse: true,
      itemCount: listMessage.length,
      itemBuilder: (BuildContext ctxt, int index) {
        DocumentSnapshot doc = listMessage[index];
        if (userID == doc["idFrom"]) {
          return FadeAnimation(0.2, userChat(context, doc, userID, store));
        } else {
          return FadeAnimation(0.2, friendChat(context, doc, doc["idFrom"], store));
        }
      }));
}
