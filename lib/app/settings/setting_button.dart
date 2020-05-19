import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twoGeeks/common_widgets/custom_flat_button.dart';

/* Buttons for settings page */

class SettingButton extends CustomFlatButton {
  SettingButton(
      {String text,
        Color textColor,
        Color buttonColor,
        VoidCallback onPressed})
      : super(
      child: Padding(
        padding: EdgeInsets.fromLTRB(25,0,25,0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
            Icon(
              Icons.arrow_forward,
              color: textColor,
            )
          ],
        ),
      ),
      color: buttonColor,
      height: 45.0,
      borderRadius: 0,
      onPressed: onPressed);
}
