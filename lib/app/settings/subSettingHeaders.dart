import 'package:flutter/material.dart';

Widget subSettingHeader(String title, context) {
  return Column(
    children: <Widget>[
      Container(
        padding: EdgeInsets.only(left: 10, top: 10),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(right: 20),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.pop(context),
                    iconSize: 35,
                  )),
              Text(
                title,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2.5,
                ),
              ),
            ],
          ),
        ),
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(80)),
            gradient: LinearGradient(
                colors: [Color(0xff2dbde8), Color(0xff0070a5)],
                begin: Alignment.topLeft)),
      ),
      Container(
        color: Color(0xff2dbde8),
        height: 30,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(40)),
              color: Color(0xfff0f6f4)),
          height: 50,
        ),
      ),
    ],
  );
}
