import 'package:flutter/material.dart';

void friendRequestComplete(context, friendUid, name) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        title: Center(child: Text("You made a new friend!")),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircleAvatar(
              key: Key("avatar"),
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
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Return",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                )),
            color: Colors.grey,
          ),
          Container(
            margin: EdgeInsets.only(left: 50, right: 10, bottom: 10, top: 10),
            child: FlatButton(
                onPressed: null,
                child: Text(
                  "Chat",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
            color: Colors.green,
          ),
        ],
      );
    },
  );
}
