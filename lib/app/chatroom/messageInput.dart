import 'package:flutter/material.dart';

Widget messageInput() {
  TextEditingController _controller;
  return Container(
    color: Color.fromRGBO(0, 0, 0, 0.13),
    child: (Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          height: 50,
          width: 300,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(17.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 4,
                  blurRadius: 7,
                  offset: Offset(4, 4),
                )
              ],
              color: Colors.white),
          child: TextFormField(
            maxLines: 200,
            controller: _controller,
            decoration: InputDecoration(
                hintText: "Write a message ...", border: InputBorder.none),
            validator: (value) {
              if (value.isEmpty) {
                return "Wrong";
              }
              return null;
            },
          ),
        ),
        IconButton(
          iconSize: 28,
          onPressed: null,
          padding: EdgeInsets.only(right: 10),
          icon: Icon(Icons.message),
        )
      ],
    )),
  );
}