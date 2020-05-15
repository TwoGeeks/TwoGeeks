import 'package:flutter/material.dart';
/// Selected can be either 1,2,3,4
/// 1 == Search
/// 2 == Home
/// 3 == Chat
/// 4 == Settings

Widget NavBar(selected) {
  Widget activatedNav(name, icon) {
    return (Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        )
      ],
    ));
  }

  Widget deactiveNav(icon) {
    return (Icon(
      icon,
      color: Color.fromRGBO(255, 255, 255, 0.5),
    ));
  }

  return BottomAppBar(
    child: Container(
      height: 60.0,
      decoration: BoxDecoration(color: Color.fromRGBO(98, 0, 238, 1.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton(
              onPressed: () => {},
              child: selected == 1
                  ? activatedNav("search", Icons.favorite)
                  : deactiveNav(Icons.favorite)),
          FlatButton(
              onPressed: () => {},
              child: selected == 2 ? activatedNav("Home", Icons.home) : deactiveNav(Icons.home)),
          FlatButton(
              onPressed: () => {},
              child: selected == 3 ? activatedNav("Chat", Icons.account_circle) : deactiveNav(Icons.account_circle)),
          FlatButton(
//              onPressed: () {
//                Navigator.pushNamed(context, "Settings");
//              },
              child: selected == 4 ? activatedNav("Settings", Icons.settings) : deactiveNav(Icons.settings)),
        ],
      ),
    ),
  );
}
