import 'package:flutter/material.dart';
import 'package:twoGeeks/app/matching/CardData.dart';

Widget cardSlide(CardData data, _removeCard, int x) {
  return (Positioned(
    top: 30,
    child: Draggable(
      onDragEnd: (drag) {
        _removeCard(x);
      },
      childWhenDragging: Container(),
      feedback: Card(
        elevation: 12,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                        data.name,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 26),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        data.desc,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 17),
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                        data.name,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 26),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        data.desc,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 17),
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
