import 'package:flutter/cupertino.dart';
import 'package:twoGeeks/common_widgets/custom_raised_button.dart';

/* Extension of Sign in button which also takes in a assetName for logos */

// creates a sign in button with logo on the left
class SignInButtonWithLogo extends CustomRaisedButton {
  SignInButtonWithLogo(
      {String text,
      String assetName,
      Color textColor,
      Color buttonColor,
      VoidCallback onPressed})
      : super(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(assetName),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                Opacity(
                  opacity: 0,
                  child: Image.asset(assetName),
                )
              ],
            ),
            color: buttonColor,
            height: 45.0,
            borderRadius: 10,
            onPressed: onPressed);
}
