import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twoGeeks/Router/routing_constants.dart';
import 'package:twoGeeks/app/matching/slideInfo.dart';
import 'package:twoGeeks/app/services/auth.dart';
import 'package:twoGeeks/app/services/user.dart';

Widget slideDeck(context, Auth auth, name, photourl, statement, uid, onNext) {
  void _sendFriendRequest() async {
    User user = await auth.currentUser();
    // get user's friend list to check if friend is already a friend
    DocumentSnapshot userData =
        await Firestore.instance.collection("users").document(user.uid).get();
    List<dynamic> friendList = userData.data["friends_user_uid"];

    if (!friendList.contains(uid)) {
      await Firestore.instance.collection("users").document(uid).updateData({
        "friendrequest_user_uid": FieldValue.arrayUnion([user.uid]),
      });
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Row(
        children: <Widget>[
          Container(
            child: Icon(Icons.person_add),
            margin: EdgeInsets.only(right: 20),
          ),
          Text("Friend Request Sent!"),
        ],
      )));
    }
  }

  return Stack(children: <Widget>[
    InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailRoute, arguments: uid);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
              child: Container(
                  color: Colors.grey.withOpacity(0.3),
                  child: Image.asset(photourl))),
          slideInfo(name, statement)
        ],
      ),
    ),
    Align(
      child: FractionallySizedBox(
          heightFactor: 1,
          widthFactor: 0.3,
          child: FlatButton(
              onPressed: () {
                onNext();
              },
              child: Container())),
      alignment: Alignment.topLeft,
    ),
    Align(
      child: FractionallySizedBox(
          heightFactor: 1,
          widthFactor: 0.3,
          child: FlatButton(onPressed: _sendFriendRequest, child: Container())),
      alignment: Alignment.topRight,
    ),
  ]);
}
