import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twoGeeks/Router/routing_constants.dart';
import 'package:twoGeeks/app/services/auth_base.dart';
import 'package:twoGeeks/common_widgets/custom_raised_button.dart';
import 'package:twoGeeks/common_widgets/email_password_form.dart';

class TwoGeeksSignUpForm extends StatefulWidget {

  TwoGeeksSignUpForm({@required this.auth,});
  final AuthBase auth;

  @override
  _TwoGeeksSignUpFormState createState() => _TwoGeeksSignUpFormState();
}

class _TwoGeeksSignUpFormState extends State<TwoGeeksSignUpForm> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String get _email => _emailController.text;
  String get _password => _passwordController.text;

  void _submit() async {
    try{
      await widget.auth.signUpWithTwoGeeks(_email, _password);
      Navigator.of(context).pushReplacementNamed(LandingRoute);
    } catch (e) {
      print(e);
    }
  }

  List<Widget> _buildChildren() {
    return [
      SizedBox(
        height: 20,
      ),
      Text(
        "Create a new TwoGeeks Account",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
      SizedBox(
        height: 8,
      ),
      Text(
        "Sign up to find a study partner",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey[400],
          fontSize: 18,
        ),
      ),
      SizedBox(
        height: 20,
      ),
      EmailPasswordForm(emailController: _emailController, passwordController: _passwordController,),
      Padding(
        padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CustomRaisedButton(
              child: Text(
                "Sign up",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              color: Colors.blue[800],
              borderRadius: 5,
              onPressed: _submit,
            ),
            SizedBox(
              height: 20,
            ),
            Row(children: <Widget>[
              Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                    child: Divider(
                      thickness: 2,
                    ),
                  )),
              Text("OR"),
              Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Divider(
                      thickness: 2,
                    ),
                  )),
            ]),
            FlatButton(
              child: Text("Already got an account? Sign in!"),
              onPressed: () => Navigator.of(context).popAndPushNamed(TwoGeeksSignInRoute),
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
