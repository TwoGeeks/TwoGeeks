import 'package:flutter/material.dart';

class TwoGeeksCircularProgressIndicator extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color titleColor;
  final Color subtitleColor;
  TwoGeeksCircularProgressIndicator(
      {this.title, this.subtitle, titleColor, subtitleColor})
      : titleColor = titleColor ?? Colors.purple[600],
        subtitleColor = subtitleColor ?? Colors.purple[500];

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  fontSize: 35,
                ),
              ),
        subtitle == null
            ? SizedBox()
            : Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: subtitleColor,
                  fontSize: 25,
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
    );
  }
}
