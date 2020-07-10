import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twoGeeks/animations/FadeAnimation.dart';
import 'package:twoGeeks/app/chat/chatContent.dart';
import 'package:twoGeeks/app/chat/chatHeader/chatHeader.dart';
import 'package:twoGeeks/app/chat/friendRequests/friendRequests.dart';
import 'package:twoGeeks/app/services/auth_base.dart';
import 'package:twoGeeks/app/services/database.dart';
import 'package:twoGeeks/app/services/user.dart';
import 'package:twoGeeks/common_widgets/navBar.dart';

class Chat extends StatefulWidget {
  Chat({this.store});

  Firestore store;

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  String uid;
  bool isFriend = false;
  Database database;

  Future<void> getCurrentUser() async {
    final auth = Provider.of<AuthBase>(context, listen: false);
    User user = await auth.currentUser();
    if (mounted) {
      setState(() {
        uid = user.uid;
        database = FireStoreDatabase(uid: user.uid);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.store == null) {
      widget.store = Firestore.instance;
    }
  }

  @override
  Widget build(BuildContext context) {
    getCurrentUser();
    if (uid == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Scaffold(
          backgroundColor: Color(0xfff0f6f4),
          body: StreamBuilder(
              stream: database.getUserProfile(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  List idList;
                  if (snapshot.data.tutor) {
                    idList = snapshot.data.tutorrequest_user_uid;
                  } else {
                    idList = snapshot.data.friendrequest_user_uid;
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      FadeAnimation(0.8, chatHeader(snapshot.data.tutor)),
                      FadeAnimation(
                        0.9,
                        friendRequests(context, uid, idList, widget.store, snapshot.data.tutor),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Chat"),
                          Switch(
                              value: isFriend,
                              onChanged: (value) {
                                setState(() {
                                  isFriend = value;
                                });
                              }),
                          Text(snapshot.data.tutor ? "Student" : "Friend"),
                        ],
                      ),
                      chatWidget(snapshot),
                    ],
                  );
                }
              }),
          bottomNavigationBar: navBar(context, 3));
    }
  }

  Widget chatWidget(snapshot) {
    if (snapshot.data.tutor) {
      if (isFriend)
        return Expanded(child: chatContent(context, uid, snapshot.data.tutors_user_uid, "friend"));
      else
        return Expanded(child: chatContent(context, uid, snapshot.data.tutors_user_uid, "chat"));
    } else {
      if (isFriend)
          return Expanded(child: chatContent(context, uid, snapshot.data.friends_user_uid, "friend"));
      else
          return Expanded(child: chatContent(context, uid, snapshot.data.friends_user_uid, "chat"));
    }
  }
}
