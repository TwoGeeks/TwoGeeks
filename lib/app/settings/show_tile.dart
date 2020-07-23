import 'package:flutter/material.dart';

class ShowTile extends StatelessWidget {
  String title;
  String subtitle;
  Function onTap;
  IconData iconData;
  ShowTile({this.title, this.subtitle, this.onTap, this.iconData = Icons.edit});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: title == null
            ? null
            : Text(
                title,
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
        subtitle: subtitle == null
            ? null
            : Text(
                subtitle,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                ),
              ),
        onTap: onTap,
        trailing: Icon(iconData),
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
}
