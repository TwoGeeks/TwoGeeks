import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:twoGeeks/app/services/auth_base.dart';
import 'package:twoGeeks/app/services/user.dart';
import 'package:twoGeeks/env/config.dart';

import 'app/services/auth_test.dart';

Widget createWidgetTester(Widget child) {
  final String userID = "userid";
  MockAuth mockAuth = MockAuth();
  when(mockAuth.currentUser())
      .thenAnswer((_) async => Future.value(User(uid: userID)));

  return AppConfig(
      test: true,
      child: Provider<AuthBase>(
        create: (context) => mockAuth,
        child: MaterialApp(
          home: Scaffold(body: child),
        ),
      ));
}
