import 'package:flutter/material.dart';
import 'package:twoGeeks/env/config.dart';

Widget createWidgetTester(Widget child) {
  return AppConfig(
      test: true,
      child: MaterialApp(
        home: child,
      ));
}
