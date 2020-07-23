import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:twoGeeks/common_widgets/custom_flat_button.dart';

class EditArrayDropdownTile extends StatefulWidget {
  final String title;
  final List<dynamic> array;
  final List<dynamic> suggestions;
  final Function onSubmit;
  final String helperText;
  final double tagFontSize;

  EditArrayDropdownTile(
      {this.title, this.helperText, this.array, this.onSubmit, this.suggestions, this.tagFontSize = 15.0,});
  @override
  _EditArrayDropdownTileState createState() => _EditArrayDropdownTileState();
}

class _EditArrayDropdownTileState extends State<EditArrayDropdownTile> {

  bool _edit = false;
  dynamic _newField;

  void _toggle() {
    setState(() {
      _edit == false ? _edit = true : _edit = false;
    });
  }

  void _submit() {
    widget.onSubmit(widget.array);
  }

  void _validateThenSubmit() {
      if (!widget.array.contains(_newField)) {
        setState(() {
          widget.array.add(_newField);
        });
        _submit();
      }
      _cancel();
  }

  void _cancel() {
    setState(() {
      _toggle();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_edit) {
      return _editTile();
    } else {
      return _showTile();
    }
  }

  Widget _editTile() {
    return Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                widget.title,
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              _buildEditWidgetFromArray(),
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
                    child: Text("Add"),
                    onPressed: _validateThenSubmit,
                    color: Colors.green.withOpacity(0.7),
                    height: 30,
                  ),
                ],
              )
            ],
          ),
        ));
  }

  Widget _showTile() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: ListTile(
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        subtitle: _buildShowWidgetFromArray(),
        onTap: _toggle,
        trailing: Icon(Icons.edit),
      ),
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.black54.withOpacity(0.2),
            )),
      ),
    );
  }

  Widget _buildShowWidgetFromArray() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Tags(
            alignment: WrapAlignment.start,
            itemCount: widget.array.length, // required
            itemBuilder: (int index) {
              final item = widget.array[index];
              return ItemTags(
                // Each ItemTags must contain a Key. Keys allow Flutter to
                // uniquely identify widgets.
                key: Key(index.toString()),
                index: index,
                // required
                title: item,
                pressEnabled: false,
                textStyle: TextStyle(
                  fontSize: widget.tagFontSize,
                ),
                combine: ItemTagsCombine.withTextBefore,
              );
            })
      ],
    );
  }

  Widget _buildEditWidgetFromArray() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Tags(
          alignment: WrapAlignment.start,
          itemCount: widget.array.length, // required
          itemBuilder: (int index) {
            final item = widget.array[index];
            return ItemTags(
              pressEnabled: false,
              // Each ItemTags must contain a Key. Keys allow Flutter to
              // uniquely identify widgets.
              key: Key(index.toString()),
              index: index, // required
              title: item,
              textStyle: TextStyle(
                fontSize: widget.tagFontSize,
              ),
              combine: ItemTagsCombine.withTextBefore,
              removeButton: ItemTagsRemoveButton(
                onRemoved: () {
                  // Remove the item from the data source.
                  setState(() {
                    // required
                    widget.array.removeAt(index);
                  });
                  //required
                  _submit();
                  return true;
                },
              ),
            );
          },
        ),
        SizedBox(
          height: 10,
        ),
        DropdownButton<String>(
            value: _newField,
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            isExpanded: true,
            style: TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String newValue) {
              setState(() {
                _newField = newValue;
              });
            },
            items: widget.suggestions
                .map<DropdownMenuItem<String>>((value) {
              return DropdownMenuItem<String>(
                value: value.toString(),
                child: Text(value),
              );
            }).toList(),
          )
      ],
    );
  }
}
