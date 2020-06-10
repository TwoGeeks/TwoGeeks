import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twoGeeks/Router/routing_constants.dart';
import 'package:twoGeeks/app/services/auth.dart';
import 'package:twoGeeks/app/matching/matching.dart';
import 'package:twoGeeks/app/services/auth_base.dart';

class MatchingHandler extends StatefulWidget {
  MatchingHandler({this.auth});
  final AuthBase auth;

  @override
  _MatchingHandlerState createState() => _MatchingHandlerState();
}

class _MatchingHandlerState extends State<MatchingHandler> {
  Future myFuture;
  List<String> idList = new List();

  // get a list of user ids
  Future<List<String>> getUsers() async {
    print("getting data");
    List<DocumentSnapshot> list;
    List<String> iDlist = new List();
    await Firestore.instance.collection("users").getDocuments().then((onValue) {
      list = onValue.documents.toList();
    });

    list.forEach((snapshot) {
      if (snapshot.documentID != null) {
        iDlist.add(snapshot.documentID);
      }
    });

    return iDlist;
  }

  @override
  void initState() {
    super.initState();
    myFuture = getUsers();
  }

  void _popUser(context) {
    if (idList.length == 1) {
      Navigator.pushReplacementNamed(context, HomeRoute);
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
              } else if (idList.length == 0) {
                return Center(
                  child: Text("END OF USERS, Well its a dead end for now"),
                );
              } else {
                return Matching(
                  onNext: () {
                    _popUser(context);
                  },
                  auth: widget.auth,
                  uid: idList[0],
                );
              }
            }
          }),
    );
  }
}
