import 'package:flutter/material.dart';

Widget infoTitle(String header) {
  return Container(
    margin: EdgeInsets.only(bottom: 10),
    child: Text(
      header,
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
  );
}
