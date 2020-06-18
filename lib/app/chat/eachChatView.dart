import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twoGeeks/Router/routing_constants.dart';
import 'package:twoGeeks/app/chatroom/chatroom.dart';

Widget eachChatView(context, userID, friendID) {
  String groupChatId;
  if (userID.hashCode <= friendID.hashCode) {
    groupChatId = '$userID-$friendID';
  } else {
    groupChatId = '$friendID-$userID';
  }

  return StreamBuilder(
      stream:
          Firestore.instance.collection("users").document(friendID).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          DocumentSnapshot friendData = snapshot.data;
          return StreamBuilder(
              stream: Firestore.instance
                  .collection("messages")
                  .document(groupChatId)
                  .collection(groupChatId)
                  .orderBy('timestamp', descending: true)
                  .limit(1)
                  .snapshots(),
              builder: (context, snapshot2) {
                if (!snapshot2.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  List<DocumentSnapshot> lastMessage = snapshot2.data.documents;
                  return Container(
                    height: 80,
                    margin: EdgeInsets.only(top: 20),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, ChatroomRoute,
                            arguments:
                                ObjectID(userID: userID, friendID: friendID));
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
                                backgroundImage: AssetImage(
                                    "images/sample_pictures/profile_pic.png"),
                                radius: 32,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  friendData["name"],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  width: 250,
                                  height: 35,
                                  child: lastMessage.length != 0
                                      ? Text(
                                          lastMessage[0]["content"],
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        )
                                      : Container(),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
              });
        }
      });
}
