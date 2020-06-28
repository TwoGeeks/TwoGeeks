import 'package:flutter/material.dart';
import 'package:twoGeeks/app/settings/show_tile.dart';
import 'package:twoGeeks/common_widgets/custom_flat_button.dart';

class EditTextTile extends StatefulWidget {
  final String title;
  final String subtitle;
  final Function onSubmit;
  final int maxLength;
  final int maxLines;

  EditTextTile(
      {this.title,
      this.subtitle,
      this.onSubmit,
      this.maxLines,
      this.maxLength});
  @override
  _EditTextTileState createState() => _EditTextTileState();
}

class _EditTextTileState extends State<EditTextTile> {
  bool _edit = false;
  TextEditingController _controller;

  void _toggle() {
    setState(() {
      _edit == false ? _edit = true : _edit = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.subtitle);
  }

  bool _validate() {
    if (_controller.text.length == 0) {
      return false;
    } else {
      return true;
    }
  }

  void _validateAndSubmit() {
    if (_validate()) {
      widget.onSubmit(_controller.text);
      _toggle();
    }
  }

  void _cancel() {
    setState(() {
      _controller = TextEditingController(text: widget.subtitle);
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
          TextFormField(
            controller: _controller,
            maxLength: widget.maxLength,
            maxLines: widget.maxLines,
            onChanged: (text) => {},
            onEditingComplete: _validateAndSubmit,
            decoration: InputDecoration(labelText: widget.title),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextFormField(
                controller: _controller,
                maxLength: widget.maxLength,
                maxLines: widget.maxLines,
                minLines: 1,
                onChanged: (text) => {},
                onEditingComplete: _validateAndSubmit,
                decoration: InputDecoration(labelText: widget.title),
              ),
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
