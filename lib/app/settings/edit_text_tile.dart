import 'package:flutter/material.dart';
import 'package:twoGeeks/common_widgets/custom_flat_button.dart';

class EditTextTile extends StatefulWidget {
  final String title;
  final String subtitle;
  final Function onSubmit;

  EditTextTile({this.title, this.subtitle, this.onSubmit});
  @override
  _EditTextTileState createState() => _EditTextTileState();
}

class _EditTextTileState extends State<EditTextTile> {
  bool _edit = false;
  TextEditingController _controller;

  void _toggle(){
    setState(() {
      _edit == false ? _edit = true : _edit = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.subtitle);
  }

  bool _validate(){
    if (_controller.text.length == 0){
      return false;
    } else {
      return true;
    }
  }

  void _validateAndSubmit(){
    if (_validate()){
      widget.onSubmit(_controller.text);
      _toggle();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_edit) {
      return _EditTile();
    } else {
      return _showTile();
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
                onChanged: (text) => {},
                onEditingComplete: _validateAndSubmit,
                decoration: InputDecoration(
                    labelText: widget.title
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  CustomFlatButton(
                    child: Text("Cancel"),
                    onPressed: _toggle,
                    color: Colors.red.withOpacity(0.7),
                    height: 30,
                  ),
                  SizedBox(width: 20,),
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
        )
    );
  }

  Widget _showTile(){
    return Container(
      child: ListTile(
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        subtitle: Text(
          widget.subtitle,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 20,
          ),
        ),
        onTap: _toggle,
        trailing: Icon(Icons.edit),
      ),
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(width: 1, color: Colors.black54.withOpacity(0.2),
            )
        ),
      ),
    );
  }
}

