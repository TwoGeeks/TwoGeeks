import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twoGeeks/app/chat/friendRequests/header.dart';
import 'package:twoGeeks/app/chat/friendRequests/showFriendAlert.dart';

Widget friendRequests(context, String userUid, List<dynamic> requestList,
    Firestore store, bool tutor) {
  return Column(
    children: <Widget>[
      header(tutor),
      Container(
        height: 90,
        width: MediaQuery.of(context).size.width * 0.9,
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.only(bottom: 100),
        decoration: BoxDecoration(
          color: Color.fromRGBO(98, 0, 238, 0.15),
          borderRadius: BorderRadius.all(Radius.circular(60.0)),
        ),
        child: ListView.builder(
          itemBuilder: (BuildContext ctxt, int index) {
            return StreamBuilder(
                stream: store
                    .collection("users")
                    .document(requestList[index])
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Container(
                      key: Key("friendRequest container"),
                      margin: EdgeInsets.all(20),
                      child: FlatButton(
                        key: Key("friendRequest button"),
                        onPressed: () => showFriendAlert(ctxt, context,
                            requestList[index], userUid, store, tutor),
                        child: CircleAvatar(
                          key: Key("friendRequest avatar"),
                          backgroundImage: snapshot.data["profilePic"] != ""
                              ? NetworkImage(snapshot.data["profilePic"])
                              : AssetImage("images/sample_pictures/profile_pic.png"),
                          radius: 25,
                        ),
                      ),
                    );
                  }
                });
          },
          itemCount: requestList.length,
          scrollDirection: Axis.horizontal,
        ),
      ),
    ],
  );
}
