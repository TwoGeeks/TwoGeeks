// Creates lines
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Lines {

  // returns a line with text in the center
  static Widget lineWithCenterText(Text text, {Color color = Colors.black, double thickness = 2}){
    return Row(children: <Widget>[
      Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
            child: Divider(
              thickness: thickness,
              color: color,
            ),
          )),
      text,
      Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            child: Divider(
              thickness: thickness,
              color: color,
            ),
          )),
    ]);
  }

  // returns a straight line
  static Widget plainLine(double thickness, {Color color = Colors.black}) {
    return Divider(
      thickness: thickness,
      color: color,
    );
  }
}