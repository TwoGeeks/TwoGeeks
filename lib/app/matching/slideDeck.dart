import 'package:flutter/material.dart';
import 'package:twoGeeks/Router/routing_constants.dart';
import 'package:twoGeeks/app/matching/slideInfo.dart';

Widget slideDeck(context, auth, name, photourl, statement, uid, onNext) {
  return Stack(children: <Widget>[
    InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailRoute, arguments: uid);
      },
      child: Column(
        children: <Widget>[
          Expanded(
              child: Container(
                  color: Colors.grey.withOpacity(0.3),
                  child: Image.asset(photourl))),
          slideInfo(name, statement)
        ],
      ),
    ),
    Align(
      child: FractionallySizedBox(
          heightFactor: 1,
          widthFactor: 0.3,
          child: FlatButton(
              onPressed: () {
                onNext();
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
