import 'package:flutter/material.dart';

List<Widget> detailHeader() {
  return [
    Row(
      children: <Widget>[
        Text(
          "Doran Lee",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        IconButton(
            icon: Icon(
              Icons.favorite,
              size: 30,
              color: Colors.red,
            ),
            onPressed: null)
      ],
    ),
    Text("18, Male"),
    Text("Jamesvile Junior College, Year 2"),
  ];
}
