import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twoGeeks/Router/routing_constants.dart';
import 'package:twoGeeks/app/matching/matching.dart';
import 'package:twoGeeks/app/services/auth_base.dart';
import 'package:twoGeeks/app/services/user.dart';

class MatchingHandler extends StatefulWidget {
  MatchingHandler();

  @override
  _MatchingHandlerState createState() => _MatchingHandlerState();
}

class _MatchingHandlerState extends State<MatchingHandler> {
  Future myFuture;
  List<String> idList = new List();
  User user;

  // get a list of user ids
  Future<List<String>> getUsers() async {
    final auth = Provider.of<AuthBase>(context, listen: false);
    user = await auth.currentUser();
    // get user's friend list and friend request list to check if friend is already a friend or already sent friend request
    DocumentSnapshot userData =
        await Firestore.instance.collection("users").document(user.uid).get();
    List<dynamic> friendList = userData.data["friends_user_uid"];
    List<dynamic> friendRequestList = userData.data["friendrequest_user_uid"];

    List<DocumentSnapshot> list;
    await Firestore.instance.collection("users").getDocuments().then((onValue) {
      list = onValue.documents.toList();
    });

    List<String> idList = new List();
    list.forEach((snapshot) {
      String id = snapshot.documentID;
      if (id != null && id != user.uid) {
        if (!friendList.contains(id) && !friendRequestList.contains(id)) {
          idList.add(snapshot.documentID);
        }
      }
    });

    return idList;
  }

  @override
  void initState() {
    super.initState();
    updateState();
  }

  Future<void> updateState() async {
    if (mounted) {
      setState(() {
        myFuture = getUsers();
      });
    }
  }

  void _popUser(context) {
    if (idList.length == 1) {
      Navigator.pushReplacementNamed(context, ChatRoute);
    } else {
      setState(() {
        idList.removeAt(0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: myFuture,
          builder: (context, snapshot) {
            if (snapshot == null) {
              return Center(child: CircularProgressIndicator());
            } else {
              idList = snapshot.data;
              if (idList == null) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Matching(
                  onNext: () {
                    _popUser(context);
                  },
                  uid: idList[0],
                );
              }
            }
          }),
    );
  }
}
