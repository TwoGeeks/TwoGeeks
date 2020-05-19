import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twoGeeks/app/services/auth_base.dart';
import 'package:twoGeeks/common_widgets/NavBar.dart';

class Matching extends StatefulWidget {
  Matching({this.auth});
  final AuthBase auth;

  @override
  _MatchingState createState() => _MatchingState();
}

class _MatchingState extends State<Matching> {
  List<Widget> cardlist;

  @override
  void initState() {
    super.initState();
    cardlist = _matchFrame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _MatchingBody(),
      bottomNavigationBar: NavBar(context, 1),
    );
  }

  Widget _MatchingBody() {
    return Stack(
      children: cardlist,
    );
  }

  List<Widget> _matchFrame() {
    List<Widget> cardlist = new List();

    List<CardData> magicbox = [
      CardData("Doran Lee",
          "qwjdijqw jqwoidjqwj j qwijejqwo qj jiojeiwq jeqwoije q  ijwqijejqwje  ijejqwijeqw. qwuehqwuheqowquhe ju wewqjjw"),
      CardData("James Bond",
          "jiwijew ineinewinjnrew wenjrnen ije nwenrjewnrnrjew njrnjewi nrj nwjnjirn ew ewn rkjnewe jnew jrewi"),
      CardData("Roy Tan",
          "jiwijew ineinewinjnrew wenjrnen ije nwenrjewnrnrjew njrnjewi nrj nwjnjirn ew ewn rkjnewe jnew jrewi")
    ];

    for (int x = 0; x < 3; x++) {
      cardlist.add(Positioned(
        top: 30,
        child: Draggable(
          onDragEnd: (drag) {
            _removeCard(x);
          },
          childWhenDragging: Container(),
          feedback: Card(
            elevation: 12,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              width: 400,
              height: 670,
              child: Column(
                children: <Widget>[
                  Image.asset("images/sample_pictures/guy1.jpg"),
                  Container(
                    margin: EdgeInsets.all(50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 30),
                          child: Text(
                            magicbox[x].name,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 26
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            magicbox[x].desc,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 17
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          child: Card(
            elevation: 12,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              width: 400,
              height: 670,
              child: Column(
                children: <Widget>[
                  Image.asset("images/sample_pictures/guy1.jpg"),
                  Container(
                    margin: EdgeInsets.all(50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 30),
                          child: Text(
                            magicbox[x].name,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 26
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            magicbox[x].desc,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 17
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ));
    }
    return cardlist;
  }

  void _removeCard(index) {
    setState(() {
      cardlist.removeAt(index);
    });
  }
}

class CardData {
  String name = "";
  String desc = "";

  CardData(String inputname, String inputdesc) {
    name = inputname;
    desc = inputdesc;
  }
}
