import 'package:flutter/material.dart';

Widget searchBar(context) {
  TextEditingController _controller;
  return Container(
    height: 25,
    width: MediaQuery.of(context).size.width * 0.8,
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.only(left: 20),
    decoration: BoxDecoration(
      color: Color.fromRGBO(0, 0, 0, 0.13),
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 7,
          offset: Offset(1, 1),
        )
      ],
    ),
    child: TextFormField(
      style: TextStyle(fontSize: 10),
      controller: _controller,
      decoration: InputDecoration(
        hintText: "Search",
        border: InputBorder.none,
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black.withOpacity(0.62),
        ),
        suffixIcon: IconButton(
          onPressed: null,
          padding: EdgeInsets.only(right: 10),
          icon: Icon(
            Icons.clear,
            color: Colors.black.withOpacity(0.62),
          ),
        ),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "Wrong";
        }
        return null;
      },
    ),
  );
}
