/*
 * Create a custom Raised button
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final double borderRadius;
  final VoidCallback onPressed;
  final double height;

  // custom raised button takes in the child, the height of the button,
  // border radius for the button and callback
  CustomFlatButton(
      {this.child,
        this.height: 50,
        this.color,
        this.borderRadius: 3,
        this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: FlatButton(
        child: this.child,
        color: this.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(this.borderRadius),
          ),
        ),
        onPressed: this.onPressed,
      ),
    );
  }
}
