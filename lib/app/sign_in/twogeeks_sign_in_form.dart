import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twoGeeks/common_widgets/custom_raised_button.dart';

class TwoGeeksSignInForm extends StatelessWidget {

  List<Widget> _buildChildren() {
    return [
      Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Text(
              "Welcome Back",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 8,),
            Text(
              "Sign in to find a study partner",
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20,),
          ],
        )
      ),
      TextField(
        decoration: InputDecoration(
          border: new OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.black87)),
          hintText: 'Email',
          labelText: 'Enter your Email',
          labelStyle: TextStyle(
            color: Colors.black,
          ),
          prefixIcon: const Icon(
            Icons.email,
            color: Colors.green,
          ),
        )
      ),
      SizedBox(height: 10,),
      TextField(
          decoration: InputDecoration(
            border: new OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.black87)),
            hintText: 'Password',
            labelStyle: TextStyle(
              color: Colors.black,
            ),
          ),
        obscureText: true,
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CustomRaisedButton(child: Text(
                "Sign in",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),color: Colors.blue[800],borderRadius: 5, onPressed: (){},),
            SizedBox(height: 20,),
            Row(
                children: <Widget>[
                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                        child: Divider(
                          thickness: 2,
                        ),
                      )
                  ),
                  Text("OR"),
                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: Divider(
                          thickness: 2,
                        ),
                      )
                  ),
                ]
            ),
            FlatButton(
              child: Text("New to TwoGeeks? Join Now"),
              onPressed: (){},
            )
          ],
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: _buildChildren(),
      ),
    );
  }
}
