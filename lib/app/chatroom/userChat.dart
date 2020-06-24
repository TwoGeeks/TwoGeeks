import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget userChat(context, DocumentSnapshot doc) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    margin: EdgeInsets.symmetric(vertical: 20),
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
        CircleAvatar(
          backgroundImage: AssetImage("images/sample_pictures/profile_pic.png"),
        ),
      ],
    )),
  );
}
