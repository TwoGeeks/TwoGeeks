import 'package:flutter/material.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:twoGeeks/app/settings/show_tile.dart';
import 'package:twoGeeks/common_widgets/custom_flat_button.dart';
import 'package:flutter_country_picker/country.dart';

class EditCountryTile extends StatefulWidget {
  final String title;
  final String subtitle;
  final Function onSubmit;

  EditCountryTile({this.title, this.subtitle, this.onSubmit});
  @override
  _EditCountryTileState createState() => _EditCountryTileState();
}

class _EditCountryTileState extends State<EditCountryTile> {
  bool _edit = false;
  Country _country;

  void _toggle() {
    setState(() {
      _edit == false ? _edit = true : _edit = false;
    });
  }

  void _submit() {
    widget.onSubmit(_country.name);
    _toggle();
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
          CountryPicker(
            showDialingCode: false,
            onChanged: (newValue) => setState(() => _country = newValue),
            selectedCountry: _country,
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
