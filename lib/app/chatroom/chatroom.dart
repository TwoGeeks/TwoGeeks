import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class Chatroom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: ChatHeader(),
        body: ChatBody(context),
        bottomNavigationBar: Transform.translate(
          offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
          child: InputWidget(),
        ));
  }
}

Widget ChatHeader() {
  return AppBar(
      backgroundColor: Color.fromRGBO(3, 218, 198, 1),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundImage:
                AssetImage("images/sample_pictures/profile_pic.png"),
          ),
          Container(
              padding: EdgeInsets.only(left: 15),
              child: Text("Name Here", style: TextStyle(color: Colors.black)))
        ],
      ),
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: null));
}

Widget ChatBody(context) {
  return (ListView.builder(
      itemCount: 13,
      itemBuilder: (BuildContext ctxt, int index) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          margin: EdgeInsets.symmetric(vertical: 20),
          child: (Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              CircleAvatar(
                backgroundImage:
                    AssetImage("images/sample_pictures/profile_pic.png"),
              ),
              Container(
                constraints: BoxConstraints(minHeight: 40,minWidth: MediaQuery.of(context).size.width * 0.5 ,maxWidth: MediaQuery.of(context).size.width * 0.5),
                margin: EdgeInsets.only(left: 20),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.14), borderRadius: BorderRadius.circular(13)),
                child: Text("Hi", textAlign: TextAlign.left,),
              )
            ],
          )),
        );
      }));
}

Widget InputWidget() {
  TextEditingController _controller;
  return Container(
    color: Color.fromRGBO(0, 0, 0, 0.13),
    child: (Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          height: 50,
          width: 300,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(17.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 4,
                  blurRadius: 7,
                  offset: Offset(4, 4),
                )
              ],
              color: Colors.white),
          child: TextFormField(
            maxLines: 200,
            controller: _controller,
            decoration: InputDecoration(
                hintText: "Write a message ...", border: InputBorder.none),
            validator: (value) {
              if (value.isEmpty) {
                return "Wrong";
              }
              return null;
            },
          ),
        ),
        IconButton(
          iconSize: 28,
          onPressed: null,
          padding: EdgeInsets.only(right: 10),
          icon: Icon(Icons.message),
        )
      ],
    )),
  );
}
