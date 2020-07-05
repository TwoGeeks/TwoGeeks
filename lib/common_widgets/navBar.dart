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
      color: Color(0xfff0f6f4),
    ));
  }

  return BottomAppBar(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 60.0,
      decoration: BoxDecoration(
          color: Color(0xfffc6767),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
              onTap: () => {
                    if (selected != 1)
                      {
                        Navigator.pushReplacementNamed(
                            context, MatchingHandlerRoute)
                      }
                  },
              child: selected == 1
                  ? activatedNav("search", Icons.favorite)
                  : deactiveNav(Icons.favorite)),
          InkWell(
              onTap: () => {
                if (selected != 5)
                  {
                    Navigator.pushReplacementNamed(
                        context, TutorMatchingRoute)
                  }
              },

              child: selected == 5
                  ? activatedNav("Tutors", Icons.library_books)
                  : deactiveNav(Icons.library_books)),
          InkWell(
              onTap: () => {
                    if (selected != 2)
                      {Navigator.pushReplacementNamed(context, HomeRoute)}
                  },
              child: selected == 2
                  ? activatedNav("Home", Icons.home)
                  : deactiveNav(Icons.home)),
          InkWell(
              onTap: () => {
                    if (selected != 3)
                      {Navigator.pushReplacementNamed(context, ChatRoute)}
                  },
              child: selected == 3
                  ? activatedNav("Chat", Icons.account_circle)
                  : deactiveNav(Icons.account_circle)),
          InkWell(
              onTap: () {
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
