import 'package:flutter/material.dart';

class EmailPasswordForm extends StatefulWidget {

  TextEditingController emailController;
  TextEditingController passwordController;
  EmailPasswordForm({this.emailController, this.passwordController});

  @override
  _EmailPasswordFormState createState() => _EmailPasswordFormState();
}

class _EmailPasswordFormState extends State<EmailPasswordForm> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: widget.emailController,
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
            )),
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: widget.passwordController,
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
      ],
    );
  }
}
