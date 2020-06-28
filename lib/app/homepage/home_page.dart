import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twoGeeks/animations/FadeAnimation.dart';
import 'package:twoGeeks/app/homepage/friendRequests/friendRequests.dart';
import 'package:twoGeeks/app/homepage/homepageHeader.dart';
import 'package:twoGeeks/app/homepage/unreadMessages/unreadMessages.dart';
import 'package:twoGeeks/app/services/auth_base.dart';
import 'package:twoGeeks/app/services/user.dart';
import 'package:twoGeeks/common_widgets/navBar.dart';

class HomePage extends StatefulWidget {
  // sign out
  HomePage({this.store});

  Firestore store;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String uid;

  Future<void> getCurrentUser() async {
    final auth = Provider.of<AuthBase>(context, listen: false);
    User user = await auth.currentUser();
    if (mounted) {
      setState(() {
        uid = user.uid;
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
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            key: Key("loader"),
          ),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Color(0xfff0f6f4),
        body: StreamBuilder(
            stream: widget.store.collection("users").document(uid).snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    key: Key("loader"),
                  ),
                );
              } else {
                List<dynamic> friendRequestList =
                    snapshot.data["friendrequest_user_uid"];
                print(friendRequestList);
                return Column(
                  children: <Widget>[
//                    FadeAnimation(0.8,
                    homepageHeader(),
//                    ),
//                    FadeAnimation(
//                      1,
                    Container(
                      margin: EdgeInsets.only(left: 40, top: 40),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Color(0xff519ff),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30))),
                      child: friendRequests(
                          context, uid, friendRequestList, widget.store),
                    ),
//                    ),
                  ],
                );
              }
            }),
        bottomNavigationBar: navBar(context, 2),
      );
    }
  }
}
