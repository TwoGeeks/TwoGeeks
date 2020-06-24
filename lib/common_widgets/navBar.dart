import 'package:flutter/material.dart';
import 'package:twoGeeks/Router/routing_constants.dart';

/// Selected can be either 1,2,3,4
/// 1 == Search
/// 2 == Home
/// 3 == Chat
/// 4 == Settings

Widget navBar(context, selected) {
  // Icons on the current page
  Widget activatedNav(name, icon) {
    return (Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          color: Color(0xff1e3c00),
        ),
        Text(
          name,
          style: TextStyle(
            color: Color(0xff1e3c00),
            fontSize: 12,
          ),
        )
      ],
    ));
  }

  // Icons that are not on the current page
  Widget deactiveNav(icon) {
    return (Icon(
      icon,
      color: Color(0xffc1bbb7),
    ));
  }

  return BottomAppBar(
    child: Container(
      height: 60.0,
      decoration: BoxDecoration(
          color: Color(0xffffcb8b),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton(
              onPressed: () => {
                    if (selected != 1)
                      {
                        Navigator.pushReplacementNamed(
                            context, MatchingHandlerRoute)
                      }
                  },
              child: selected == 1
                  ? activatedNav("search", Icons.favorite)
                  : deactiveNav(Icons.favorite)),
          FlatButton(
              onPressed: () => {
                    if (selected != 2)
                      {Navigator.pushReplacementNamed(context, HomeRoute)}
                  },
              child: selected == 2
                  ? activatedNav("Home", Icons.home)
                  : deactiveNav(Icons.home)),
          FlatButton(
              onPressed: () => {
                    if (selected != 3)
                      {Navigator.pushReplacementNamed(context, ChatRoute)}
                  },
              child: selected == 3
                  ? activatedNav("Chat", Icons.account_circle)
                  : deactiveNav(Icons.account_circle)),
          FlatButton(
              onPressed: () {
                if (selected != 4) {
                  Navigator.pushReplacementNamed(context, SettingRoute);
                }
              },
              child: selected == 4
                  ? activatedNav("Settings", Icons.settings)
                  : deactiveNav(Icons.settings)),
        ],
      ),
    ),
  );
}
