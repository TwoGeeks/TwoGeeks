import 'package:flutter/material.dart';
import 'package:twoGeeks/Router/routing_constants.dart';
import 'package:twoGeeks/app/matching/matching.dart';
import 'package:twoGeeks/app/matching/slideInfo.dart';

Widget slideDeck(context, auth, name, photourl, desc) {
  return Stack(children: <Widget>[
    InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailRoute, arguments: "NDJvfZcLKPg7wwsedibOnivzErJ2");
      },
      child: Column(
        children: <Widget>[
          Expanded(
              child: Container(
                  color: Colors.grey.withOpacity(0.3),
                  child: Image.asset(photourl))),
          slideInfo(name, desc)
        ],
      ),
    ),
    Align(
      child: FractionallySizedBox(
          heightFactor: 1,
          widthFactor: 0.3,
          child: FlatButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Matching(
                              auth: auth,
                              name: "Frank",
                              photourl: "images/sample_pictures/guy2.jpg",
                              desc:
                                  "Hi, I am a computing major in NTU! Looking to me great friends and expriences",
                            )));
              },
              child: Container())),
      alignment: Alignment.topLeft,
    ),
    Align(
      child: FractionallySizedBox(
          heightFactor: 1,
          widthFactor: 0.3,
          child: FlatButton(
              onPressed: () {
                print("Like");
              },
              child: Container())),
      alignment: Alignment.topRight,
    ),
  ]);
}
