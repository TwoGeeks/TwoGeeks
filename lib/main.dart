import 'package:flutter/material.dart';
import 'package:twoGeeks/app/sign_in/sign_in_page.dart';

void main() {
  runApp(TwoGeeks());
}

class TwoGeeks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Two Geeks',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignInPage(),
    );
  }
}
