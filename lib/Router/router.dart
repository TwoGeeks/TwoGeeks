import 'package:flutter/material.dart';
import 'package:twoGeeks/app/Undefined/undefined.dart';
import 'package:twoGeeks/app/chatroom/chatroom.dart';
import 'package:twoGeeks/app/home_page.dart';
import 'package:twoGeeks/app/matching/matching.dart';
import 'package:twoGeeks/app/sign_in/sign_in_page.dart';
import 'package:twoGeeks/Router/routing_constants.dart';
import 'package:twoGeeks/app/landing_page.dart';
import 'package:twoGeeks/app/settings/settings_page.dart';
import 'package:twoGeeks/app/services/auth.dart';
import 'package:twoGeeks/app/sign_in/twogeeks_sign_in.dart';
import 'package:twoGeeks/app/sign_up/sign_up_page.dart';

Auth auth;
Route<dynamic> generateRoute(RouteSettings settings) {

  switch (settings.name) {
    // Add more routes here
    case SignInRoute:
      return MaterialPageRoute(builder: (context) => SignInPage(auth: auth,));
    case ChatroomRoute:
      return MaterialPageRoute(builder: (context) => Chatroom());
    case LandingRoute:
      return MaterialPageRoute(builder: (context) => LandingPage(auth: auth,));

    // To be implemented below
    case 'Signup':
      return MaterialPageRoute(builder: (context) => TwoGeeksSignUpPage(auth: auth,));
    case HomeRoute:
      return MaterialPageRoute(builder: (context) => HomePage(auth: auth,));
    case TwoGeeksSignInRoute:
      return MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => TwoGeeksSignInPage(auth: auth,)
      );
    case MatchingRoute:
      return MaterialPageRoute(builder: (context) => Matching(auth: auth,));
//    case 'Matching':
//      return MaterialPageRoute(builder: (context) => Matching());
//    case 'Details':
//      return MaterialPageRoute(builder: (context) => Details());
//    case 'Chatlist':
//      return MaterialPageRoute(builder: (context) => Chatlist());
    case SettingRoute:
      return MaterialPageRoute(builder: (context) => Settings(auth: auth,));
    default:
      return MaterialPageRoute(
          builder: (context) => Undefined(name: settings.name));
  }
}
