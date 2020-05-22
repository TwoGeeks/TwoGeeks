import 'package:flutter/material.dart';

Widget messageHeader(context) {
  return AppBar(
      backgroundColor: Color.fromRGBO(3, 218, 198, 1),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundImage:
                AssetImage("images/sample_pictures/profile_pic.png"),
          ),
          Container(
              padding: EdgeInsets.only(left: 15),
              child: Text("Name Here", style: TextStyle(color: Colors.black)))
        ],
      ),
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          }));
}
