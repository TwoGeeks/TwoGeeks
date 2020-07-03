import 'package:flutter/material.dart';
import 'package:twoGeeks/Router/routing_constants.dart';
import 'package:twoGeeks/common_widgets/navBar.dart';

class TutorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: 40),
              child: Text(
                "Tutors Available",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: null,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: GridTile(
                            child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, TutorDetailRoute, arguments: "7eNFbEQg7iMPDWLTU3CfQiXXmVZ2");
                          },
                          child: Container(
                              padding: EdgeInsets.all(10),
                              child: Image.asset(
                                "images/sample_pictures/guy1.jpg",
                                fit: BoxFit.cover,
                              )),
                        )),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
      bottomNavigationBar: navBar(context, 5),
    );
  }
}
