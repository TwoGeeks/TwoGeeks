import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

// You can use AppConfig.of(context) to get the test bool

class AppConfig extends InheritedWidget {
  AppConfig({@required this.test, @required Widget child}) : super(child: child);
  final bool test;

  static AppConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
