import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:twoGeeks/app/chat/chat.dart';

import '../../createWidgetTester.dart';

void main() {
  group("Chat page test", () {
    testWidgets("shows loader while fetching data",
            (WidgetTester tester) async {
          final instance = MockFirestoreInstance();
          await tester.pumpWidget(createWidgetTester(Chat(
            store: instance,
          )));

          await tester.idle();
//          final nameFinder = find.byKey(Key("loader"));
//
//          expect(loaderFinder, findsOneWidget);
        });
  });
}
