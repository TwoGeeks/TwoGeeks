import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twoGeeks/app/matching/slideDeck.dart';
import 'package:twoGeeks/app/services/auth_base.dart';
import 'package:twoGeeks/common_widgets/navBar.dart';

class Matching extends StatelessWidget {
  Matching({this.onNext, this.auth, this.uid});
  final Function onNext;
  final AuthBase auth;
  final String uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Firestore.instance.collection("users").document(uid).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator(),);
          } else {
            DocumentSnapshot user = snapshot.data;
            return slideDeck(
                context, auth, user["name"], "images/sample_pictures/guy1.jpg", user["statement"], uid, onNext);
          }
        }
      ),
      bottomNavigationBar: navBar(context, 1),
    );
  }
}
