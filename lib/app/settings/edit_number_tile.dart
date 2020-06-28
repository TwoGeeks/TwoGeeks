import 'package:flutter/material.dart';
import 'package:twoGeeks/app/settings/show_tile.dart';
import 'package:twoGeeks/common_widgets/custom_flat_button.dart';
import 'package:numberpicker/numberpicker.dart';

class EditNumberTile extends StatefulWidget {
  final String title;
  final String subtitle;
  final Function onSubmit;


  EditNumberTile({this.title, this.subtitle, this.onSubmit});
  @override
  _EditNumberTileState createState() => _EditNumberTileState();
}

class _EditNumberTileState extends State<EditNumberTile> {
  bool _edit = false;
  int _currentVal;

  @override
  void initState() {
    super.initState();
    try {
      _currentVal = int.parse(widget.subtitle);
    } on FormatException {
      _currentVal = 0;
    }
  }

  void _toggle(){
    setState(() {
      _edit == false ? _edit = true : _edit = false;
    });
  }


  void _submit(){
      widget.onSubmit(_currentVal);
      _toggle();
  }

  void _cancel(){
    setState(() {
      _currentVal = int.parse(widget.subtitle);
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
              Text("Age: $_currentVal"),
            NumberPicker.integer(initialValue: _currentVal, minValue: 0, maxValue: 130, onChanged: (newValue) =>
                setState(() => _currentVal = newValue)),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  CustomFlatButton(
                    child: Text("Cancel"),
                    onPressed: _cancel,
                    color: Colors.red.withOpacity(0.7),
                    height: 30,
                  ),
                  SizedBox(width: 20,),
                  CustomFlatButton(
                    child: Text("Submit"),
                    onPressed: _submit,
                    color: Colors.green.withOpacity(0.7),
                    height: 30,
                  ),
                ],
              )
            ],
          ),
        )
    );
  }
}

