import 'package:flutter/material.dart';

List<Widget> detailTutorHeader(data) {
  String name = data["name"];
  String age = data["age"];
  String gender = data["gender"] == "m" ? "Male" : "Female";
  String currentSchool = data["currentSchool"];
  String currentSchoolYear = data["currentSchoolYear"];

  Widget formatSchoolData(currentSchool, currentSchoolYear) {
    if (currentSchool == "" && currentSchoolYear == "") {
      return Text("");
    } else if (currentSchool == "") {
      return Text(currentSchoolYear);
    } else if (currentSchoolYear == "") {
      return Text(currentSchool);
    } else {
      return Text("$currentSchool, $currentSchoolYear");
    }
  }

  return [
    Row(
      children: <Widget>[
        Text(
          name,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ],
    ),
    Text("$age, $gender"),
    formatSchoolData(currentSchool, currentSchoolYear)
  ];
}
