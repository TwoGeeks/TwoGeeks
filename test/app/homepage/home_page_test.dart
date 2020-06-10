import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:twoGeeks/app/homepage/home_page.dart';
import 'package:mockito/mockito.dart';
import 'package:twoGeeks/app/services/user.dart';
import '../../createWidgetTester.dart';
import '../services/auth_test.dart';

void main() {
  group("homepage test", () {
    final String userID = "userid";
    final String friendName = "my friend name";
    final String friendID = "id1";
    MockAuth mockAuth = MockAuth();
    when(mockAuth.currentUser())
        .thenAnswer((_) async => Future.value(User(uid: userID)));

    testWidgets("shows loader while fetching data",
        (WidgetTester tester) async {
      final instance = MockFirestoreInstance();
      await tester.pumpWidget(createWidgetTester(HomePage(
        auth: mockAuth,
        store: instance,
      )));

      await tester.idle();
      final loaderFinder = find.byKey(Key("loader"));

      expect(loaderFinder, findsOneWidget);
    });

    testWidgets("have friendrequest list and inlcudes buttons and avatar",
        (WidgetTester tester) async {
      final instance = MockFirestoreInstance();
      await instance.collection("users").document(userID).setData({
        "friendrequest_user_uid": ["id1", "id2", "id3", "id4", "id5"]
      });

      await tester.pumpWidget(createWidgetTester(HomePage(
        auth: mockAuth,
        store: instance,
      )));

      await tester.idle();
      await tester.pump();
      await tester.idle();
      await tester.pump();

      final friendrequestFinder = find.byKey(Key("friendRequest container"));
      final friendrequestButton = find.byKey(Key("friendRequest button"));
      final friendrequestAvatar = find.byKey(Key("friendRequest avatar"));

      expect(friendrequestFinder, findsNWidgets(5));
      expect(friendrequestButton, findsNWidgets(5));
      expect(friendrequestAvatar, findsNWidgets(5));
    });

    testWidgets("clicking on avatar will show alert dialog",
        (WidgetTester tester) async {
      final instance = MockFirestoreInstance();
      await instance.collection("users").document(userID).setData({
        "friendrequest_user_uid": [friendID]
      });
      await instance
          .collection("users")
          .document(friendID)
          .setData({"name": friendName});

      await tester.pumpWidget(MaterialApp(
          home: HomePage(
        auth: mockAuth,
        store: instance,
      )));

      await tester.idle();
      await tester.pump();
      await tester.pump();
      await tester.tap(find.byKey(Key("friendRequest button")));
      await tester.pump();

      Finder findFriendsName = find.text(friendName);
      Finder findFriendImage = find.byKey(Key("Friend Image"));
      Finder findRejectButton = find.text("Reject");
      Finder findAcceptButton = find.text("Accept");

      expect(find.text("Friend request from: "), findsOneWidget);
      expect(findFriendsName, findsOneWidget);
      expect(findFriendImage, findsOneWidget);
      expect(findAcceptButton, findsOneWidget);
      expect(findRejectButton, findsOneWidget);
    });

    testWidgets(
        "rejecting friend request will remove friendID from friend request list",
        (WidgetTester tester) async {
      final instance = MockFirestoreInstance();
      await instance.collection("users").document(userID).setData({
        "friendrequest_user_uid": [friendID]
      });
      await instance
          .collection("users")
          .document(friendID)
          .setData({"name": friendName});

      await tester.pumpWidget(MaterialApp(
          home: HomePage(
        auth: mockAuth,
        store: instance,
      )));

      await tester.idle();
      await tester.pump();
      await tester.pump();
      await tester.tap(find.byKey(Key("friendRequest button")));
      await tester.pump();
      await tester.tap(find.text("Reject"));
      await tester.idle();
      await tester.pump();

      DocumentSnapshot doc =
          await instance.collection("users").document(userID).get();
      final friendRequestList = doc.data["friendrequest_user_uid"];
      final isEmpty = [];

      expect(friendRequestList, isEmpty);
    });

    testWidgets(
        "accepting friend request will remove friendID from friend request list and add to friends list",
        (WidgetTester tester) async {
      final instance = MockFirestoreInstance();
      await instance.collection("users").document(userID).setData({
        "friends_user_uid": [],
        "friendrequest_user_uid": [friendID]
      });

      await instance
          .collection("users")
          .document(friendID)
          .setData({"name": friendName});

      await tester.pumpWidget(MaterialApp(
          home: HomePage(
        auth: mockAuth,
        store: instance,
      )));

      await tester.idle();
      await tester.pump();
      await tester.pump();
      await tester.tap(find.byKey(Key("friendRequest button")));
      await tester.pump();
      await tester.tap(find.text("Accept"));
      await tester.idle();
      await tester.pump();

      DocumentSnapshot doc =
          await instance.collection("users").document(userID).get();
      final friendRequestList = doc.data["friendrequest_user_uid"];
      final friendsList = doc.data["friends_user_uid"];
      final isEmpty = [];

      expect(friendRequestList, isEmpty);
      expect(friendsList, [friendID]);
    });

    testWidgets(
        "accepting friend request will show friend request complete dialog",
            (WidgetTester tester) async {
          final instance = MockFirestoreInstance();
          await instance.collection("users").document(userID).setData({
            "friends_user_uid": [],
            "friendrequest_user_uid": [friendID]
          });

          await instance
              .collection("users")
              .document(friendID)
              .setData({"name": friendName});

          await tester.pumpWidget(MaterialApp(
              home: HomePage(
                auth: mockAuth,
                store: instance,
              )));

          await tester.idle();
          await tester.pump();
          await tester.pump();
          await tester.tap(find.byKey(Key("friendRequest button")));
          await tester.pump();
          await tester.tap(find.text("Accept"));
          await tester.idle();
          await tester.pump();

          Finder makeNewFriendFinder = find.text("You made a new friend!");
          Finder avatarFinder = find.byKey(Key("avatar"));
          Finder nameFinder = find.text(friendName);
          Finder returnButtonFinder = find.text("Return");
          Finder chatButtonFinder = find.text("Chat");

          expect(makeNewFriendFinder, findsOneWidget);
          expect(avatarFinder, findsOneWidget);
          expect(nameFinder, findsOneWidget);
          expect(returnButtonFinder, findsOneWidget);
          expect(chatButtonFinder, findsOneWidget);
        });
  });
}
