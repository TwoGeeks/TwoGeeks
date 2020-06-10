import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twoGeeks/Router/routing_constants.dart';
import 'package:twoGeeks/app/services/auth_base.dart';
import 'package:twoGeeks/common_widgets/custom_raised_button.dart';
import 'package:twoGeeks/common_widgets/email_password_form.dart';
import 'package:twoGeeks/common_widgets/platform_alert_dialog.dart';
import 'package:twoGeeks/common_widgets/validators.dart';
import 'package:twoGeeks/common_widgets/lines.dart';

class TwoGeeksSignInForm extends StatefulWidget with EmailAndPasswordValidator{

  TwoGeeksSignInForm({@required this.auth,});
  final AuthBase auth;

  @override
  _TwoGeeksSignInFormState createState() => _TwoGeeksSignInFormState();
}

class _TwoGeeksSignInFormState extends State<TwoGeeksSignInForm> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String get _email => _emailController.text;
  String get _password => _passwordController.text;
  bool submitted = false;
  bool isLoading = false;

  void _submit() async {
    setState(() {
      submitted = true;
      isLoading = true;
    });
    try{
      await widget.auth.signInWithTwoGeeks(_email, _password);
      Navigator.of(context).pushReplacementNamed(LandingRoute);
    } catch (e) {
      PlatformAlertDialog(
        title: "Sign In Failed",
        content: e.toString().split(",")[1].trim(),
        defaultActionText: 'OK',
      ).show(context);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _updateState(){
    setState(() {

    });
  }

  List<Widget> _buildChildren() {

    bool _submitEnabled = widget.emailValidator.isValid(_email) &&
    widget.passwordValidator.isValid(_password) && !isLoading;

    return [
      SizedBox(
        height: 20,
      ),
      Text(
        "Welcome Back",
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
        "Sign in to find a study partner",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey[400],
          fontSize: 18,
        ),
      ),
      SizedBox(
        height: 20,
      ),
      EmailPasswordForm(emailController: _emailController, passwordController: _passwordController,
        onSubmit: _submitEnabled ? _submit : null,
        onChanged: _updateState, submitted: submitted, isLoading: isLoading,),
      Padding(
        padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CustomRaisedButton(
              child: Text(
                "Sign in",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              color: Colors.blue[800],
              borderRadius: 5,
              onPressed:  _submitEnabled ? _submit : null,
            ),
            SizedBox(
              height: 20,
            ),
            Lines.lineWithCenterText(Text("or"))
            ,
            FlatButton(
              child: Text("New to TwoGeeks? Join Now!"),
              onPressed: () => Navigator.of(context).popAndPushNamed("Signup"),
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
