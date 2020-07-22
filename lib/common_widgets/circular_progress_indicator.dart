import 'package:flutter/material.dart';

class TwoGeeksCircularProgressIndicator extends StatelessWidget {

  final String title;
  final String subtitle;
  TwoGeeksCircularProgressIndicator({this.title, this.subtitle});

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
            color: Colors.purple[600],
            fontSize: 35,
          ),
        ),
        subtitle == null
        ? SizedBox()
        : Text(
          subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.purple[500],
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
