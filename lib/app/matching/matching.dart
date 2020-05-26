import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twoGeeks/app/matching/slideDeck.dart';
import 'package:twoGeeks/app/services/auth_base.dart';
import 'package:twoGeeks/common_widgets/navBar.dart';

class Matching extends StatefulWidget {
  Matching({this.auth, this.name, this.photourl, this.desc});
  final AuthBase auth;
  final String name;
  final String photourl;
  final String desc;

  @override
  _MatchingState createState() => _MatchingState();
}

class _MatchingState extends State<Matching> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: slideDeck(context, widget.auth, widget.name, widget.photourl, widget.desc),
      bottomNavigationBar: navBar(context, 1),
    );
  }
}
