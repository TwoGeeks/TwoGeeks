/*
 * Create a custom Raised button
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {

  final Widget child;
  final Color color;
  final double borderRadius;
  final VoidCallback onPressed;
  final double padding;

  CustomRaisedButton({this.child, this.color, this.padding, this.borderRadius, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: this.child,
      color: this.color,
      padding: EdgeInsets.all(padding),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(this.borderRadius),
        ),
      ),
      onPressed: this.onPressed,
    );
  }
}
