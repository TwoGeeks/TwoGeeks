import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:twoGeeks/app/chatroom/chatroom.dart';

import '../../createWidgetTester.dart';

void main() {
  group("Chatroom page test", () {
    final String friendID = "id1";
    final String ownID = "id2";

    testWidgets("show profile image, name and chat messages",
        (WidgetTester tester) async {
      final instance = MockFirestoreInstance();
      await instance.collection("users").document(ownID).setData({
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
        "friends_user_uid": [friendID]
      });
      await instance.collection("users").document(friendID).setData({
        "name": "Friend 1",
        "age": "23",
        "gender": "m",
        "currentSchool": "NUS",
        "currentSchoolYear": "year2 sem1",
        "aboutMe": "This is a test statement",
        "strength": ["Math", "English"],
        "weakness": ["Science", "Biology", "Chinese"],
        "hobbies": ["badminton", "volleyball"],
        "profilePic": "",
        "friends_user_uid": [ownID]
      });
      await instance
          .collection("messages")
          .document("$friendID-$ownID")
          .collection("$friendID-$ownID")
          .document("1593358014588")
          .setData({
        "content": "Hi",
        "idFrom": friendID,
        "idTo": ownID,
        "timestamp": "1593358014639",
      });
      await instance
          .collection("messages")
          .document("$friendID-$ownID")
          .collection("$friendID-$ownID")
          .document("1593358014589")
          .setData({
        "content": "Chat message 2",
        "idFrom": ownID,
        "idTo": friendID,
        "timestamp": "1593358014640",
      });

      await tester.pumpWidget(createWidgetTester(Chatroom(
        objectID: ObjectID(userID: ownID, friendID: friendID),
        store: instance,
      )));

      await tester.pumpAndSettle();

      final imageFinder = find.byKey(Key("Image of friend"));
      expect(imageFinder, findsOneWidget);

      final nameFinder = find.text("Friend 1");
      expect(nameFinder, findsOneWidget);

      final chatFinder = find.text("Hi");
      expect(chatFinder, findsOneWidget);

      final chatTwoFinder = find.text("Chat message 2");
      expect(chatTwoFinder, findsOneWidget);
    });

    testWidgets("send a message", (WidgetTester tester) async {
      final instance = MockFirestoreInstance();
      await instance.collection("users").document(ownID).setData({
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
        "friends_user_uid": [friendID]
      });
      await instance.collection("users").document(friendID).setData({
        "name": "Friend 1",
        "age": "23",
        "gender": "m",
        "currentSchool": "NUS",
        "currentSchoolYear": "year2 sem1",
        "aboutMe": "This is a test statement",
        "strength": ["Math", "English"],
        "weakness": ["Science", "Biology", "Chinese"],
        "hobbies": ["badminton", "volleyball"],
        "profilePic": "",
        "friends_user_uid": [ownID]
      });
      await instance
          .collection("messages")
          .document("$friendID-$ownID")
          .collection("$friendID-$ownID")
          .document("1593358014588")
          .setData({
        "content": "Hi",
        "idFrom": friendID,
        "idTo": ownID,
        "timestamp": "1593358014639",
      });
      await instance
          .collection("messages")
          .document("$friendID-$ownID")
          .collection("$friendID-$ownID")
          .document("1593358014589")
          .setData({
        "content": "Chat message 2",
        "idFrom": ownID,
        "idTo": friendID,
        "timestamp": "1593358014640",
      });

      await tester.pumpWidget(createWidgetTester(Chatroom(
        objectID: ObjectID(userID: ownID, friendID: friendID),
        store: instance,
      )));

      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField), "Hello");
      await tester.tap(find.byKey(Key("Submit button")));
      await tester.idle();

      String firestoreData = instance.dump();
      RegExp exp = RegExp("Hello");
      bool matches = exp.hasMatch(firestoreData);

      expect(matches, true);
    });
  });
}
