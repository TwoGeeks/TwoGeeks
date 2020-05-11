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
                fontWeight: FontWeight.w600,
                fontSize: 32,
              ),
            ),
            color: buttonColor,
            borderRadius: 15,
            onPressed: onPressed);
}
