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
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              FadeAnimation(0.8, chatHeader()),
              FadeAnimation(
                0.9,
                StreamBuilder(
                    stream: database.getUserProfile(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return friendRequests(context, uid,
                            snapshot.data.friends_user_uid, widget.store);
                      }
                    }),
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
                          print(isFriend);
                        });
                      }),
                  Text("Friend"),
                ],
              ),
              isFriend
                  ? Expanded(child: chatContent(context, uid, "friend"))
                  : Expanded(child: chatContent(context, uid, "chat")),
            ],
          ),
          bottomNavigationBar: navBar(context, 3));
    }
  }
}
