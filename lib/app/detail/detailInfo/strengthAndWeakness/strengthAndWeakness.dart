import 'package:flutter/material.dart';
import 'package:twoGeeks/app/detail/detailInfo/infoTitle.dart';
import 'package:twoGeeks/app/detail/detailInfo/strengthAndWeakness/strengthTile.dart';
import 'package:twoGeeks/app/detail/detailInfo/strengthAndWeakness/weaknessTile.dart';

Widget strengthAndWeakness() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      infoTitle("Strengths and Weaknesses"),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                strengthTile("Math"),
                strengthTile("Science"),
                strengthTile("Art"),
                strengthTile("H2 biology"),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                weaknessTile("English"),
                weaknessTile("Chemistry")
              ],
            ),
          ),
        ],
      )
    ],
  );
}
