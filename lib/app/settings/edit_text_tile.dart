import 'package:flutter/material.dart';
import 'package:twoGeeks/app/settings/show_tile.dart';
import 'package:twoGeeks/common_widgets/custom_flat_button.dart';

class EditTextTile extends StatefulWidget {
  final String title;
  final String subtitle;
  final Function onSubmit;
  final int maxLength;
  final int maxLines;
  @required final Function validator;

  EditTextTile(
      {this.title,
        this.subtitle,
        this.onSubmit,
        this.maxLines,
        this.maxLength,
      this.validator});
  @override
  _EditTextTileState createState() => _EditTextTileState();
}

class _EditTextTileState extends State<EditTextTile> {

  bool _edit = false;
  String _newVal;
  final _formKey = GlobalKey<FormState>();

  void _toggle() {
    setState(() {
      _edit == false ? _edit = true : _edit = false;
    });
  }

  void _validateAndSubmit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      widget.onSubmit(_newVal);
      _toggle();
    }
  }

  void _cancel() {
    setState(() {
      _toggle();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_edit) {
      return _EditTile();
    } else {
      return ShowTile(
        title: widget.title,
        subtitle: widget.subtitle,
        onTap: _toggle,
      );
    }
  }

  Widget _EditTile() {
    return Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Form(
                key: _formKey,
                child: TextFormField(
                  validator: widget.validator,
                  initialValue: widget.subtitle,
                  onSaved: (value) => _newVal = value,
                  maxLength: widget.maxLength,
                  maxLines: widget.maxLines,
                  onChanged: (text) => {},
                  onEditingComplete: _validateAndSubmit,
                  decoration: InputDecoration(labelText: widget.title),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  CustomFlatButton(
                    child: Text("Cancel"),
                    onPressed: _cancel,
                    color: Colors.red.withOpacity(0.7),
                    height: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CustomFlatButton(
                    child: Text("Submit"),
                    onPressed: _validateAndSubmit,
                    color: Colors.green.withOpacity(0.7),
                    height: 30,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
