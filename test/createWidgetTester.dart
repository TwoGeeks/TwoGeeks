import 'package:flutter/material.dart';
import 'package:twoGeeks/app/services/auth_provider.dart';
import 'package:twoGeeks/env/config.dart';

import 'app/services/auth_test.dart';

Widget createWidgetTester(Widget child) {
  return AppConfig(
      test: true,
      child: AuthProvider(
        auth: MockAuth(),
        child: MaterialApp(
          home: Scaffold(body: child),
        ),
      ));
}
