/*
 * Create a custom Raised button
 */

import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {

  final Widget child;
  final Color color;
  final double borderRadius;
  final VoidCallback onPressed;

  CustomRaisedButton({this.child, this.color, this.borderRadius, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: this.child,
      color: this.color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(this.borderRadius),
        ),
      ),
      onPressed: this.onPressed,
    );
  }
}
