import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twoGeeks/Router/routing_constants.dart';
import 'package:twoGeeks/Router/router.dart' as router;
import 'package:twoGeeks/app/landing.dart';
import 'package:twoGeeks/app/services/auth.dart';
import 'package:twoGeeks/app/services/auth_base.dart';

void main() {
  runApp(TwoGeeks());
}

class TwoGeeks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (context) => Auth(),
      child: MaterialApp(
        initialRoute: LandingRoute,
        onGenerateRoute: router.generateRoute,
        home: LandingPage(),
        title: 'Two Geeks',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
      ),
    );
  }
}
