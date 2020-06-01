import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twoGeeks/app/detail/backButton.dart';
import 'package:twoGeeks/app/detail/detailHeader.dart';
import 'package:twoGeeks/app/detail/detailInfo/aboutMe.dart';
import 'package:twoGeeks/app/detail/detailInfo/strengthAndWeakness/strengthAndWeakness.dart';
import 'package:twoGeeks/app/detail/detailInfo/hobbies.dart';

class Detail extends StatelessWidget {
  final String uid;
  const Detail({Key key, this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: Firestore.instance
              .collection("users/${uid}")
              .document("personalInfo/${uid}")
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              DocumentSnapshot data = snapshot.data;
              return SingleChildScrollView(
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.asset("images/sample_pictures/guy1.jpg"),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              ...detailHeader(data),
                              aboutMe(data["aboutMe"]),
                              strengthAndWeakness(
                                  data["strength"], data["weakness"]),
                              hobbies(data["hobbies"]),
                            ],
                          ),
                        )
                      ],
                    ),
                    backButton(context)
                  ],
                ),
              );
            }
          }),
    );
  }
}
