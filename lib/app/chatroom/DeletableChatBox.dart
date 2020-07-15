import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twoGeeks/app/services/database.dart';
import 'package:twoGeeks/common_widgets/platform_alert_dialog.dart';

class DeletableChatBox extends StatelessWidget {

  final Widget child;
  final Function onDelete;

  DeletableChatBox({this.child, this.onDelete});

  Future<void> _confirmDelete(BuildContext context) async {
    final requestDelete = await PlatformAlertDialog(
      title: Text("Do you want to delete message?"),
      defaultActionText: 'Yes',
      cancelActionText: "No",
    ).show(context);
    if (requestDelete) {
      onDelete();
    }
  }


  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: child,
      onLongPress: () => _confirmDelete(context),
    );
  }
}
