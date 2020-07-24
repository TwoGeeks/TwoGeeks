import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget friendChat(context, DocumentSnapshot doc, String uid) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    margin: EdgeInsets.symmetric(vertical: 20),
    child: (Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        StreamBuilder(
            stream: Firestore.instance
                .collection("users")
                .document(uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return CircleAvatar(
                  backgroundImage: snapshot.data["profilePic"] != ""
                      ? NetworkImage(snapshot.data["profilePic"])
                      : AssetImage("images/sample_pictures/profile_pic.png"),
                );
              }
            }),
        Container(
          constraints: BoxConstraints(
              minHeight: 40,
              minWidth: MediaQuery.of(context).size.width * 0.5,
              maxWidth: MediaQuery.of(context).size.width * 0.5),
          margin: EdgeInsets.only(left: 20),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(13)),
          child: Text(
            doc["content"],
            textAlign: TextAlign.left,
          ),
        )
      ],
    )),
  );
}
