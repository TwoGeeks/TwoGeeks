import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twoGeeks/app/homepage/friendRequests/friendRequests.dart';
import 'package:twoGeeks/app/homepage/unreadMessages/unreadMessages.dart';
import 'package:twoGeeks/app/services/auth_base.dart';
import 'package:twoGeeks/app/services/user.dart';
import 'package:twoGeeks/common_widgets/navBar.dart';

class HomePage extends StatefulWidget {
  // sign out
  HomePage({this.auth, this.store});
  final AuthBase auth;
  Firestore store;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String uid;

  Future<String> getCurrentUser() async {
    User user = await widget.auth.currentUser();
    setState(() {
      uid = user.uid;
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    if (widget.store == null) {
      widget.store = Firestore.instance;
    }
  }

  @override
  Widget build(BuildContext context) {
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
                return Column(
                  children: <Widget>[
                    unreadMessages(context),
                    Divider(
                      color: Colors.black,
                      thickness: 1,
                      indent: 50,
                      endIndent: 50,
                    ),
                    friendRequests(
                        context, uid, friendRequestList, widget.store),
                  ],
                );
              }
            }),
        bottomNavigationBar: navBar(context, 2),
      );
    }
  }
}
