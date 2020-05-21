import 'package:flutter/material.dart';
import 'package:twoGeeks/Router/routing_constants.dart';
import 'package:twoGeeks/app/services/auth.dart';
import 'package:twoGeeks/common_widgets/NavBar.dart';

class Chat extends StatelessWidget {
  final Auth auth;

  Chat({this.auth});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _ChatHeader(context),
        body: _ChatBody(context),
        bottomNavigationBar: NavBar(context, 3));
  }
}

Widget _ChatHeader(context) {
  return AppBar(
    backgroundColor: Colors.white,
    title: _Searchbar(context),
    bottom: PreferredSize(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(30, 4, 0, 4),
              color: Color.fromRGBO(174, 74, 203, 0.3),
              child: Text(
                "YOUR FRIENDS",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        preferredSize: Size.fromHeight(20)),
  );
}

Widget _ChatBody(context) {
  return (ListView.builder(
      itemCount: 13,
      itemBuilder: (BuildContext ctxt, int index) {
        return Container(
          height: 80,
          margin: EdgeInsets.only(top: 20),
          child: FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, ChatroomRoute);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(227, 184, 255, 1),
                borderRadius: BorderRadius.all(Radius.circular(17.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(1, 1),
                  )
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage("images/sample_pictures/profile_pic.png"),
                      radius: 32,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Name",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 250,
                        height: 35,
                        child: Text(
                          "Message here i jus testing this. I dont know what else to write here so if u are still reading then good for you :)",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }));
}

Widget _Searchbar(context) {
  TextEditingController _controller;
  return Container(
    height: 25,
    width: MediaQuery.of(context).size.width * 0.8,
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.only(left: 20),
    decoration: BoxDecoration(
      color: Color.fromRGBO(0, 0, 0, 0.13),
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 7,
          offset: Offset(1, 1),
        )
      ],
    ),
    child: TextFormField(
      style: TextStyle(fontSize: 10),
      controller: _controller,
      decoration: InputDecoration(
        hintText: "Search",
        border: InputBorder.none,
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black.withOpacity(0.62),
        ),
        suffixIcon: IconButton(
          onPressed: null,
          padding: EdgeInsets.only(right: 10),
          icon: Icon(
            Icons.clear,
            color: Colors.black.withOpacity(0.62),
          ),
        ),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "Wrong";
        }
        return null;
      },
    ),
  );
}
