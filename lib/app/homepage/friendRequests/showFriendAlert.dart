import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twoGeeks/app/homepage/friendRequests/addToFriendsList.dart';
import 'package:twoGeeks/app/homepage/friendRequests/friendRequestComplete.dart';
import 'package:twoGeeks/app/homepage/friendRequests/rejectRequest.dart';

void showFriendAlert(context, contextMain, friendUid, userUid) async {
  DocumentSnapshot user =
      await Firestore.instance.collection("users").document(friendUid).get();
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
                  bool done = await rejectRequest(friendUid, userUid);
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
                  bool done =
                      await addToFriendsList(context, friendUid, userUid);
                  if (done) {
                    friendRequestComplete(contextMain, friendUid, name);
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
