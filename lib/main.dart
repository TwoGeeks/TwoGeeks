import 'package:flutter/material.dart';
import 'package:twoGeeks/Router/routing_constants.dart';
import 'package:twoGeeks/Router/router.dart' as router;
import 'package:twoGeeks/app/landing.dart';
import 'package:twoGeeks/app/services/auth.dart';

void main() {
  runApp(TwoGeeks());
}

class TwoGeeks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    router.auth = Auth();
    return MaterialApp(
      initialRoute: LandingRoute,
      onGenerateRoute: router.generateRoute,
      home: LandingPage(
        auth: Auth(),
      ),
      title: 'Two Geeks',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
    );
  }
}
