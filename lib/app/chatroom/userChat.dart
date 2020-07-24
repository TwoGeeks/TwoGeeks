import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'DeletableChatBox.dart';

Widget userChat(context, DocumentSnapshot doc, String uid, Firestore store) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    margin: EdgeInsets.symmetric(vertical: 20),
    child: DeletableChatBox(
      onDelete: doc.reference.delete,
      child: (Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
                minHeight: 40,
                minWidth: MediaQuery.of(context).size.width * 0.5,
                maxWidth: MediaQuery.of(context).size.width * 0.5),
            margin: EdgeInsets.only(right: 20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Color(0xfffbceb5),
                borderRadius: BorderRadius.circular(13)),
            child: Text(
              doc["content"],
              textAlign: TextAlign.left,
            ),
          ),
          StreamBuilder(
              stream: store.collection("users").document(uid).snapshots(),
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
        ],
      )),
    ),
  );
}
