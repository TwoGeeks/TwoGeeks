import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twoGeeks/Router/routing_constants.dart';
import 'package:twoGeeks/app/services/auth_base.dart';
import 'package:twoGeeks/app/services/user.dart';
import 'package:twoGeeks/common_widgets/navBar.dart';

class TutorList extends StatefulWidget {
  @override
  _TutorListState createState() => _TutorListState();
}

class _TutorListState extends State<TutorList> {
  Future myFuture;
  List<DocumentSnapshot> idList = new List();
  User user;

  Future<List<DocumentSnapshot>> getUsers() async {
    final auth = Provider.of<AuthBase>(context, listen: false);
    user = await auth.currentUser();
    // get user's friend list and friend request list to check if friend is already a friend or already sent friend request
    DocumentSnapshot userData =
        await Firestore.instance.collection("users").document(user.uid).get();
    List<dynamic> friendList = userData.data["friends_user_uid"];
    List<dynamic> friendRequestList = userData.data["friendrequest_user_uid"];

    List<DocumentSnapshot> list;
    await Firestore.instance.collection("users").getDocuments().then((onValue) {
      list = onValue.documents.toList();
    });

    List<DocumentSnapshot> idList = new List();
    list.forEach((snapshot) {
      String id = snapshot.documentID;
      if (id != null && id != user.uid) {
        if (!friendList.contains(id) && !friendRequestList.contains(id)) {
          if (snapshot.data["tutor"] == true) {
            idList.add(snapshot);
          }
        }
      }
    });

    return idList;
  }

  @override
  void initState() {
    super.initState();
    updateState();
  }

  Future<void> updateState() async {
    if (mounted) {
      setState(() {
        myFuture = getUsers();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f6f4),
      body: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: 40),
              child: Text(
                "Tutors Available",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          Expanded(
            child: FutureBuilder(
                future: myFuture,
                builder: (context, snapshot) {
                  if (snapshot == null) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    idList = snapshot.data;
                    if (idList != null) {
                      return Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                        child: GridView.builder(
                            itemCount: idList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, TutorDetailRoute,
                                      arguments: idList[index].documentID);
                                },
                                child: Card(
                                  elevation: 1.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        AspectRatio(
                                          aspectRatio: 18.0 / 12.0,
                                          child: idList[index]
                                                      .data["profilePic"] !=
                                                  ""
                                              ? Image.network(
                                                  idList[index]
                                                      .data["profilePic"],
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.asset(
                                                  "images/sample_pictures/guy1.jpg",
                                                  fit: BoxFit.cover,
                                                ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(idList[index].data["name"]),
                                            ],
                                          ),
                                        )
                                      ]),
                                ),
                              );
                            }),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }
                }),
          ),
        ],
      ),
      bottomNavigationBar: navBar(context, 5),
    );
  }
}
