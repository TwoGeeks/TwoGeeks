import 'package:flutter/material.dart';

Widget backButton(context) {
  return Align(
    alignment: Alignment.topLeft,
    child: Container(
      margin: EdgeInsets.only(left: 10, top: 25),
      decoration: ShapeDecoration(
          shape: CircleBorder(), color: Colors.white.withOpacity(0.85)),
      child: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ),
  );
}
