import 'package:flutter/material.dart';

class EmailPasswordForm extends StatefulWidget {

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function onSubmit;
  final Function onChanged;
  EmailPasswordForm({this.emailController, this.passwordController, this.onSubmit, this.onChanged});

  @override
  _EmailPasswordFormState createState() => _EmailPasswordFormState();
}

class _EmailPasswordFormState extends State<EmailPasswordForm> {

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  void _emailEditingComplete() {
    FocusScope.of(context).requestFocus(_passwordFocusNode);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Email text field
        TextField(
          controller: widget.emailController,
            autocorrect: false,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            focusNode: _emailFocusNode,
            onEditingComplete: _emailEditingComplete,
            onChanged: (email) => widget.onChanged(),
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
            ),
        ),
        SizedBox(
          height: 10,
        ),
        // Password text field
        TextField(
          controller: widget.passwordController,
          textInputAction: TextInputAction.done,
          focusNode: _passwordFocusNode,
          onEditingComplete: widget.onSubmit,
          onChanged: (password) => widget.onChanged(),
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
