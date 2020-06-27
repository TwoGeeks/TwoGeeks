import 'package:flutter/material.dart';

class EditTile extends StatefulWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  EditTile({this.title, this.subtitle, this.onTap});
  @override
  _EditTileState createState() => _EditTileState();
}

class _EditTileState extends State<EditTile> {
  bool _edit = false;

  void _toggle(){
    setState(() {
      _edit == false ? _edit = true : _edit = false;
    });
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
    return Form(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    labelText: widget.title
                ),
              ),
              FlatButton(
                child: Text("toggle"),
                onPressed: _toggle,
              )
            ],
          ),
        )
      ),
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

