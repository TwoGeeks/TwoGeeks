import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twoGeeks/app/chat/chat.dart';
import 'package:twoGeeks/app/matching_engine/match_engine.dart';
import 'package:twoGeeks/app/sign_in/sign_in_page.dart';
import 'package:twoGeeks/app/services/user.dart';
import 'package:twoGeeks/app/services/auth_base.dart';
import 'package:geolocator/geolocator.dart';

class LandingPage extends StatelessWidget {

//  final Geolocator _geolocator = Geolocator()..forceAndroidLocationManager;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User>(
      stream: auth.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User user = snapshot.data;
          if (user == null) {
            return SignInPage();
          }
          else{
//            _geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
              MatchEngine.instance.initialise(user.uid);
              return Chat();
          }
        } else {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "TwoGeeks",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.purple[600],
                    fontSize: 35,
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey[400],
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
