import 'package:flutter/material.dart';
import 'package:twoGeeks/app/chat/chatContent.dart';
import 'package:twoGeeks/app/chat/chatHeader/chatHeader.dart';
import 'package:twoGeeks/app/services/auth.dart';
import 'package:twoGeeks/common_widgets/navBar.dart';

class Chat extends StatelessWidget {
  final Auth auth;

  Chat({this.auth});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: chatHeader(context),
        body: chatContent(context),
        bottomNavigationBar: navBar(context, 3));
  }
}
