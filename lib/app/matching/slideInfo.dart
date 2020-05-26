import 'package:flutter/material.dart';

Widget slideInfo(name, desc) {
  return Container(
    margin: EdgeInsets.only(bottom: 20),
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 15),
          child: Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        Text(
            desc, style: TextStyle(fontSize: 18),)
      ],
    ),
  );
}
