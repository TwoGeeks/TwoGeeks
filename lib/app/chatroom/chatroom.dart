import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:twoGeeks/app/chatroom/messageBody.dart';
import 'package:twoGeeks/app/chatroom/messageHeader.dart';
import 'package:twoGeeks/app/chatroom/messageInput.dart';

class ObjectID {
  String userID;
  String friendID;

  ObjectID({this.userID, this.friendID});
}

class Chatroom extends StatefulWidget {
  final ObjectID objectID;
  Chatroom({this.objectID});

  @override
  _ChatroomState createState() => _ChatroomState();
}

class _ChatroomState extends State<Chatroom> {
  String groupChatId;
  String userID;
  String friendID;
  TextEditingController _controller = TextEditingController();
  ScrollController listScrollController = ScrollController();

  void getChatID() {
    userID = widget.objectID.userID;
    friendID = widget.objectID.friendID;
    if (userID.hashCode <= friendID.hashCode) {
      setState(() {
        groupChatId = '$userID-$friendID';
      });
    } else {
      setState(() {
        groupChatId = '$friendID-$userID';
      });
    }
  }

  void onSendMessage() {
    String message = _controller.text;
    if (message.trim() != '') {
      _controller.clear();

      var documentReference = Firestore.instance
          .collection('messages')
          .document(groupChatId)
          .collection(groupChatId)
          .document(DateTime.now().millisecondsSinceEpoch.toString());
      Firestore.instance.runTransaction((transaction) async {
        await transaction.set(
          documentReference,
          {
            'idFrom': userID,
            'idTo': friendID,
            'timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
            'content': message,
//            'type': type
          },
        );
      });
      listScrollController.animateTo(0.0,
          duration: Duration(milliseconds: 400), curve: Curves.easeOut);
    }
  }

  @override
  void initState() {
    super.initState();
    getChatID();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f6f4),
      resizeToAvoidBottomInset: true,
      appBar: messageHeader(context, friendID),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            StreamBuilder(
                stream: Firestore.instance
                    .collection("messages")
                    .document(groupChatId)
                    .collection(groupChatId)
                    .orderBy('timestamp', descending: true)
                    .limit(20)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    List<DocumentSnapshot> listMessage =
                        snapshot.data.documents;
                    return Flexible(
                      child: messageBody(
                          context, listMessage, userID, listScrollController),
                    );
                  }
                }),
            messageInput(onSendMessage, _controller)
          ],
        ),
      ),
    );
  }
}
