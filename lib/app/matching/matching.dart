import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twoGeeks/app/matching/CardData.dart';
import 'package:twoGeeks/app/matching/cardSlide.dart';
import 'package:twoGeeks/app/services/auth_base.dart';
import 'package:twoGeeks/common_widgets/navBar.dart';

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
      body: matchingBody(),
      bottomNavigationBar: navBar(context, 1),
    );
  }

  Widget matchingBody() {
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
      cardlist.add(cardSlide(magicbox[x], _removeCard, x));
    }
    return cardlist;
  }

  void _removeCard(index) {
    setState(() {
      cardlist.removeAt(index);
    });
  }
}