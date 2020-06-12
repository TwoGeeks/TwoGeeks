import 'package:flutter/material.dart';
import 'package:twoGeeks/app/chat/chatContent.dart';
import 'package:twoGeeks/app/chat/chatHeader/chatHeader.dart';
import 'package:twoGeeks/app/services/auth.dart';
import 'package:twoGeeks/app/services/user.dart';
import 'package:twoGeeks/common_widgets/navBar.dart';

class Chat extends StatefulWidget {
  final Auth auth;
  Chat({this.auth});

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  String uid;

  Future<void> getCurrentUser() async {
    User user = await widget.auth.currentUser();
    setState(() {
      uid = user.uid;
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    if (uid == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Scaffold(
          appBar: chatHeader(context),
          body: chatContent(context, uid),
          bottomNavigationBar: navBar(context, 3));
    }
  }
}
