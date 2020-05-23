import 'package:flutter/material.dart';
import 'package:twoGeeks/app/detail/detailHeader.dart';
import 'package:twoGeeks/app/detail/detailInfo/aboutMe.dart';
import 'package:twoGeeks/app/detail/detailInfo/strengthAndWeakness/strengthAndWeakness.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset("images/sample_pictures/guy1.jpg"),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ...detailHeader(),
                  aboutMe(),
                  strengthAndWeakness(),
                  aboutMe(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
