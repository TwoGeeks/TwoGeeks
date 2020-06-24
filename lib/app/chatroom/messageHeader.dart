import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget messageHeader(context, String friendID) {
  return AppBar(
      backgroundColor: Color(0xff2398ab),
      title: StreamBuilder(
          stream: Firestore.instance
              .collection("users")
              .document(friendID)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              DocumentSnapshot doc = snapshot.data;
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage:
                        AssetImage("images/sample_pictures/profile_pic.png"),
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(doc["name"],
                          style: TextStyle(color: Colors.black)))
                ],
              );
            }
          }),
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          }));
}
