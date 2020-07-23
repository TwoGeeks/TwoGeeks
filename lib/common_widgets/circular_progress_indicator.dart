import 'package:flutter/material.dart';

class TwoGeeksCircularProgressIndicator extends StatelessWidget {
  final String title;
  final String subtitle;
  final double titleFont;
  final Color titleColor;
  final Color subtitleColor;
  final double subtitleFont;
  final Color backgroundColor;
  TwoGeeksCircularProgressIndicator(
      {this.title,
      this.subtitle,
      titleColor,
      subtitleColor,
      backgroundColor,
      this.titleFont = 35,
      this.subtitleFont = 25})
      : titleColor = titleColor ?? Colors.purple[600],
        subtitleColor = subtitleColor ?? Colors.purple[500],
        backgroundColor = backgroundColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          title == null
              ? SizedBox()
              : Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: titleColor,
                    fontSize: titleFont,
                  ),
                ),
          SizedBox(
            height: 30,
          ),
          subtitle == null
              ? SizedBox()
              : Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: subtitleColor,
                    fontSize: subtitleFont,
                  ),
                ),
          SizedBox(
            height: 35,
          ),
          Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey[400],
            ),
          )
        ],
      ),
    );
  }
}
