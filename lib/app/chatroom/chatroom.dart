import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:twoGeeks/app/chatroom/messageBody.dart';
import 'package:twoGeeks/app/chatroom/messageHeader.dart';
import 'package:twoGeeks/app/chatroom/messageInput.dart';

class Chatroom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: messageHeader(context),
        body: messageBody(context),
        bottomNavigationBar: Transform.translate(
          offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
          child: messageInput(),
        ));
  }
}
