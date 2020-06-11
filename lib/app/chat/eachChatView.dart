import 'package:flutter/material.dart';
import 'package:twoGeeks/Router/routing_constants.dart';
import 'package:twoGeeks/app/chatroom/chatroom.dart';

Widget eachChatView(context, userID, friendID) {
  return Container(
    height: 80,
    margin: EdgeInsets.only(top: 20),
    child: FlatButton(
      onPressed: () {
        Navigator.pushNamed(context, ChatroomRoute, arguments: ObjectID(userID: userID, friendID: friendID));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(227, 184, 255, 1),
          borderRadius: BorderRadius.all(Radius.circular(17.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(1, 1),
            )
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width * 0.9,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 20),
              child: CircleAvatar(
                backgroundImage:
                    AssetImage("images/sample_pictures/profile_pic.png"),
                radius: 32,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Name",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 250,
                  height: 35,
                  child: Text(
                    "Message here i jus testing this. I dont know what else to write here so if u are still reading then good for you :)",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
