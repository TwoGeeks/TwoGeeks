import 'config.dart';
import 'package:twoGeeks/main.dart';
import 'package:flutter/material.dart';

void main() {
  var configuredApp = new AppConfig(test: false, child: new TwoGeeks());

  runApp(configuredApp);
}
