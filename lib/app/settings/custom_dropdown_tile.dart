import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twoGeeks/app/settings/show_tile.dart';
import 'package:twoGeeks/common_widgets/custom_flat_button.dart';

class CustomDropdownTile extends StatefulWidget {
  final String title;
  final String subtitle;
  final List<String> list;
  final Function onSubmit;

  CustomDropdownTile({this.title, this.subtitle, this.onSubmit, this.list});
  @override
  _CustomDropdownTileState createState() => _CustomDropdownTileState();
}

class _CustomDropdownTileState extends State<CustomDropdownTile> {
  bool _edit = false;
  String _currentGrade;

  @override
  void initState() {
    super.initState();
    _currentGrade = widget.subtitle;
  }

  void _toggle() {
    setState(() {
      _edit == false ? _edit = true : _edit = false;
    });
  }

  void _submit() {
    widget.onSubmit(_currentGrade);
    _toggle();
  }

  void _cancel() {
    setState(() {
      _currentGrade = widget.subtitle;
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
          Text(
            widget.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.black87,
            ),
          ),
          DropdownButton<String>(
            value: _currentGrade,
            onChanged: (val) {
              setState(() {
                _currentGrade = val;
              });
            },
            items: widget.list
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            isExpanded: true,
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
                onPressed: _submit,
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
