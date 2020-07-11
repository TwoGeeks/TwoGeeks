import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twoGeeks/app/detail/backButton.dart';
import 'package:twoGeeks/app/detail/detailHeader.dart';
import 'package:twoGeeks/app/detail/detailInfo/aboutMe.dart';
import 'package:twoGeeks/app/detail/detailInfo/strengthAndWeakness/strengthAndWeakness.dart';
import 'package:twoGeeks/app/detail/detailInfo/hobbies.dart';

class Detail extends StatelessWidget {
  final String uid;
  Firestore store;
  Detail({this.uid, this.store});

  @override
  Widget build(BuildContext context) {
    if (store == null) {
      store = Firestore.instance;
    }
//    print(store);
    return Scaffold(
      body: StreamBuilder(
          stream: store.collection("users").document("$uid").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  key: Key("loader"),
                ),
              );
            } else {
              DocumentSnapshot data = snapshot.data;
              return SingleChildScrollView(
                key: Key("Detail ScrollView"),
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: 18.0 / 18.0,
                          child: data["profilePic"] != ""
                              ? Image.network(data["profilePic"])
                              : Image.asset(
                                  "images/sample_pictures/guy1.jpg",
                                  key: Key("image of friend"),
                                ),
                        ),
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
