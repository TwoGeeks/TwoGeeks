import 'package:flutter/material.dart';

Widget weaknessTile(String subject) {
  return Row(children: <Widget>[
    Icon(
      Icons.album,
      key: Key("Icon"),
    ),
    Text(subject)
  ]);
}
