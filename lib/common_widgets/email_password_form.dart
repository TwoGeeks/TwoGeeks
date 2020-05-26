import 'package:flutter/material.dart';
import 'package:twoGeeks/common_widgets/validators.dart';
// this is a form template for email and password

class EmailPasswordForm extends StatefulWidget with EmailAndPasswordValidator{

  final TextEditingController emailController;
  final TextEditingController passwordController;
  // onSubmit is triggered when user submits using keyboard
  final Function onSubmit;
  // onchange is to trigger the onchange in the parent
  final Function onChanged;
  // submitted is a boolean value to check if form has been submitted
  // to trigger errorText
  final bool submitted;
  EmailPasswordForm({this.emailController, this.passwordController, this.onSubmit, this.onChanged, this.submitted});

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
    bool _showEmailError = !widget.emailValidator.isValid(widget.emailController.text) && widget.submitted;
    bool _showPasswordError = !widget.passwordValidator.isValid(widget.passwordController.text) && widget.submitted;
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
              errorText: _showEmailError ? widget.emailCannotBeEmpty : null,
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
            errorText: _showPasswordError ? widget.passwordCannotBeEmpty : null,
          ),
          obscureText: true,
        ),
      ],
    );
  }
}
