import 'config.dart';
import 'package:twoGeeks/main.dart';
import 'package:flutter/material.dart';

void main() {
  var configuredApp = new AppConfig(test: true, child: new TwoGeeks());

  runApp(configuredApp);
}