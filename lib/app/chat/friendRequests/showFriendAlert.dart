import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twoGeeks/app/chat/friendRequests/addToFriendsList.dart';
import 'package:twoGeeks/app/chat/friendRequests/friendRequestComplete.dart';
import 'package:twoGeeks/app/chat/friendRequests/rejectRequest.dart';

void showFriendAlert(
    context, contextMain, friendUid, userUid, Firestore store) async {
  DocumentSnapshot user =
      await store.collection("users").document(friendUid).get();
  String name = user.data["name"];
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        title: Center(child: Text("Friend request from: ")),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircleAvatar(
              key: Key("Friend Image"),
              backgroundImage:
                  AssetImage("images/sample_pictures/profile_pic.png"),
              radius: 25,
            ),
            Text(
              name,
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: <Widget>[
          Container(
            child: FlatButton(
                onPressed: () async {
                  bool done = await rejectRequest(friendUid, userUid, store);
                  if (done) {
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  "Reject",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                )),
            color: Colors.grey,
          ),
          Container(
            margin: EdgeInsets.only(left: 50, right: 10, bottom: 10, top: 10),
            child: FlatButton(
                onPressed: () async {
                  bool done = await addToFriendsList(
                      context, friendUid, userUid, store);
                  if (done) {
                    friendRequestComplete(
                        contextMain, friendUid, userUid, name);
                  }
                },
                child: Text(
                  "Accept",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
            color: Colors.green,
          ),
        ],
      );
    },
  );
}
