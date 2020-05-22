import 'package:flutter/material.dart';

Widget messageBody(context) {
  return (ListView.builder(
      itemCount: 13,
      itemBuilder: (BuildContext ctxt, int index) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          margin: EdgeInsets.symmetric(vertical: 20),
          child: (Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              CircleAvatar(
                backgroundImage:
                    AssetImage("images/sample_pictures/profile_pic.png"),
              ),
              Container(
                constraints: BoxConstraints(
                    minHeight: 40,
                    minWidth: MediaQuery.of(context).size.width * 0.5,
                    maxWidth: MediaQuery.of(context).size.width * 0.5),
                margin: EdgeInsets.only(left: 20),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.14),
                    borderRadius: BorderRadius.circular(13)),
                child: Text(
                  "Hi",
                  textAlign: TextAlign.left,
                ),
              )
            ],
          )),
        );
      }));
}
