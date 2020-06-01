import 'package:flutter/material.dart';

List<Widget> detailHeader(data) {
  String name = data["name"];
  int age = data["age"];
  String gender = data["gender"] == "m" ? "Male" : "Female";
  String currentSchool = data["currentSchool"];
  String currentSchoolYear = data["currentSchoolYear"];

  return [
    Row(
      children: <Widget>[
        Text(
          name,
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
    Text("$age, $gender"),
    Text("$currentSchool, $currentSchoolYear"),
  ];
}
