import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twoGeeks/app/matching/slideDeck.dart';
import 'package:twoGeeks/app/services/auth_base.dart';
import 'package:twoGeeks/common_widgets/navBar.dart';
import 'package:twoGeeks/app/matching_engine/match_engine.dart';

class Matching extends StatelessWidget {
  Matching({this.onNext, this.uid});
  final Function onNext;
  final String uid;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    print("match");
    MatchEngine.instance.match();
    return Scaffold(
      body: StreamBuilder(
          stream:
              Firestore.instance.collection("users").document(uid).snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              DocumentSnapshot user = snapshot.data;
              return slideDeck(
                  context,
                  auth,
                  user["name"],
                  "images/sample_pictures/guy1.jpg",
                  user["statement"],
                  uid,
                  onNext);
            }
          }),
      bottomNavigationBar: navBar(context, 1),
    );
  }
}
