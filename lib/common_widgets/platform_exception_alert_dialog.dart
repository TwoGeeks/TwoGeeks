import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:twoGeeks/common_widgets/platform_alert_dialog.dart';
import 'package:meta/meta.dart';

// create customised messages for PlatformException in the form of PlatformAlertDialog
class PlatformExceptionAlertDialog extends PlatformAlertDialog{


  PlatformExceptionAlertDialog({
    @required String title,
    @required PlatformException exception,
  }) : super(
    title: title,
    content: _message(exception),
    defaultActionText: "OK",
  );

  // maps PlatformException error to customised messages
  static String _message(PlatformException error){
    return error.message;
  }
}