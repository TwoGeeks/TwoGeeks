import 'package:flutter/material.dart';
import 'package:twoGeeks/app/detail/detailInfo/infoTitle.dart';
import 'package:twoGeeks/app/detail/detailInfo/strengthAndWeakness/strengthTile.dart';
import 'package:twoGeeks/app/detail/detailInfo/strengthAndWeakness/weaknessTile.dart';

Widget strengthAndWeakness(strengths, weaknesses) {
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
                for (var strength in strengths) strengthTile(strength),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                for (var weakness in weaknesses) weaknessTile(weakness),
              ],
            ),
          ),
        ],
      )
    ],
  );
}
