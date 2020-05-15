import 'package:flutter/material.dart';
import 'package:twoGeeks/app/Undefined/undefined.dart';
import 'package:twoGeeks/app/chatroom/chatroom.dart';
import 'package:twoGeeks/app/sign_in/sign_in_page.dart';
import 'package:twoGeeks/Router/routing_constants.dart';
import 'package:twoGeeks/app/landing_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    // Add more routes here
    case SignInRoute:
      return MaterialPageRoute(builder: (context) => SignInPage());
    case ChatroomRoute:
      return MaterialPageRoute(builder: (context) => Chatroom());
    case LandingRoute:
      return MaterialPageRoute(builder: (context) => LandingPage());

    // To be implemented below
//    case 'Signup':
//      return MaterialPageRoute(builder: (context) => SignUp());
//    case 'Main':
//      return MaterialPageRoute(builder: (context) => Main());
//    case 'Matching':
//      return MaterialPageRoute(builder: (context) => Matching());
//    case 'Details':
//      return MaterialPageRoute(builder: (context) => Details());
//    case 'Chatlist':
//      return MaterialPageRoute(builder: (context) => Chatlist());
//    case 'Settings':
//      return MaterialPageRoute(builder: (context) => Settings());
    default:
      return MaterialPageRoute(
          builder: (context) => Undefined(name: settings.name));
  }
}
