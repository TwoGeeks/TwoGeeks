import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:twoGeeks/app/detail/detail.dart';

import '../../createWidgetTester.dart';

void main() {
  group("Details page test", () {
    final String friendID = "id1";

    testWidgets("shows loader while fetching data",
        (WidgetTester tester) async {
      final instance = MockFirestoreInstance();
      await tester.pumpWidget(createWidgetTester(Detail(
        uid: friendID,
        store: instance,
      )));

      await tester.idle();
      final loaderFinder = find.byKey(Key("loader"));

      expect(loaderFinder, findsOneWidget);
    });

    testWidgets(
        "show scroll view and contains image, name, age, gender, school and schoolyear",
        (WidgetTester tester) async {
      final instance = MockFirestoreInstance();
      await instance.collection("users").document(friendID).setData({
        "name": "Jon",
        "age": "23",
        "gender": "m",
        "currentSchool": "NUS",
        "currentSchoolYear": "year2 sem1",
        "aboutMe": "This is a test statement",
        "strength": ["Math", "English"],
        "weakness": ["Science", "Biology", "Chinese"],
        "hobbies": ["badminton", "volleyball"],
        "profilePic": "",
      });

      await tester.pumpWidget(createWidgetTester(Detail(
        uid: friendID,
        store: instance,
      )));

      await tester.idle();
      await tester.pump();

      final scrollViewFinder = find.byKey(Key("Detail ScrollView"));
      final imageFinder = find.byKey(Key("image of friend"));

      expect(scrollViewFinder, findsOneWidget);
      expect(imageFinder, findsOneWidget);

      final nameFinder = find.text("Jon");
      expect(nameFinder, findsOneWidget);

      final ageAndGenderFinder = find.text("23, Male");
      expect(ageAndGenderFinder, findsOneWidget);

      final currentSchoolFinder = find.text("NUS, year2 sem1");
      expect(currentSchoolFinder, findsOneWidget);
    });

    testWidgets("show back button with back button icon",
        (WidgetTester tester) async {
      final instance = MockFirestoreInstance();
      await instance.collection("users").document(friendID).setData({
        "name": "Jon",
        "age": "23",
        "gender": "m",
        "currentSchool": "NUS",
        "currentSchoolYear": "year2 sem1",
        "aboutMe": "This is a test statement",
        "strength": ["Math", "English"],
        "weakness": ["Science", "Biology", "Chinese"],
        "hobbies": ["badminton", "volleyball"],
        "profilePic": "",
      });

      await tester.pumpWidget(createWidgetTester(Detail(
        uid: friendID,
        store: instance,
      )));

      await tester.idle();
      await tester.pump();

      final backButtonFinder = find.byKey(Key("Back Button"));
      final backIconFinder = find.byKey(Key("Back Button Icon"));

      expect(backButtonFinder, findsOneWidget);
      expect(backIconFinder, findsOneWidget);
    });
  });
}
