import 'package:flutter/material.dart';

Widget strengthTile(String subject) {
  return Row(
    children: <Widget>[Icon(Icons.security), Text(subject)],
  );
}
