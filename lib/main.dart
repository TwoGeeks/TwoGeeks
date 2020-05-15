import 'package:flutter/material.dart';
import 'package:twoGeeks/Router/routing_constants.dart';
import 'package:twoGeeks/Router/router.dart' as router;

void main() {
  runApp(TwoGeeks());
}

class TwoGeeks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LandingRoute,
      onGenerateRoute: router.generateRoute,
      title: 'Two Geeks',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
    );
  }
}
