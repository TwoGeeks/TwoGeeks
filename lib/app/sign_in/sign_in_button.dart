import 'package:flutter/cupertino.dart';
import 'package:twoGeeks/common_widgets/custom_raised_button.dart';

class SignInButton extends CustomRaisedButton {
  SignInButton(
      {String text, Color textColor, Color buttonColor, VoidCallback onPressed})
      : super(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            color: buttonColor,
            height: 45.0,
            borderRadius: 10,
            onPressed: onPressed);
}
