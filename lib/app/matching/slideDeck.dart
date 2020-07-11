import 'dart:ui';

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
          duration: Duration(seconds: 2),
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

    onNext();
  }

  print(photourl);
  return Stack(children: <Widget>[
    InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailRoute, arguments: uid);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0.0, 2.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
//                child: Image.network(
//                  photourl,
//                  fit: BoxFit.cover,
//                  loadingBuilder: (BuildContext ctxt, Widget child, ImageChunkEvent loadingProgress) {
//                    if (loadingProgress == null) return child;
//                    return Center(child: CircularProgressIndicator(),);
//                  },
//                ),
                  child: AspectRatio(
                    aspectRatio: 18.0 / 18.0,
                    child: photourl == ""
                        ? Image.asset(
                            "images/sample_pictures/guy1.jpg",
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            photourl,
                            fit: BoxFit.cover,
                          ),
                  ))),
          slideInfo(name, statement),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                onTap: () {
                  onNext();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xffec008c), Color(0xfffc6767)]),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                  ),
                  child: Text(
                    "Reject",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: _sendFriendRequest,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xff04ce9b), Color(0xff64e408)]),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30)),
                  ),
                  child: Text(
                    "Send Friend Request",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
          Spacer(),
        ],
      ),
    ),
  ]);
}
