import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:twoGeeks/common_widgets/custom_flat_button.dart';
import 'package:twoGeeks/common_widgets/custom_raised_button.dart';
import 'package:twoGeeks/common_widgets/platform_alert_dialog.dart';

class AddPhoto extends StatefulWidget {

  final Function updateImgUrl;
  AddPhoto({@required this.updateImgUrl});

  @override
  _AddPhotoState createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  File profilePic;
  final storageReference = FirebaseStorage.instance;

  Future _chooseFile() async {
    await ImagePicker().getImage(source: ImageSource.gallery).then((image) {
      setState(() {
        profilePic = File(image.path);
      });
    });
  }

  void _sendData() async {
    String _imageUrl;
    StorageReference imageRef =
        storageReference.ref().child("profile/picture/${path.basename(profilePic.path)}");
    StorageUploadTask uploadTask = imageRef.putFile(profilePic);
    await uploadTask.onComplete;
    _imageUrl = await imageRef.getDownloadURL();

    widget.updateImgUrl(_imageUrl).then((_) => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    return PlatformAlertDialog(
      title: "Add a photo",
      content: Center(
          child: Column(
        children: <Widget>[
          profilePic == null
              ? Container(
                  height: 150,
                )
              : Image.asset(profilePic.path),
          profilePic == null
              ? CustomFlatButton(
                  onPressed: _chooseFile,
                  child: Text("Add profile picture"),
                  color: Colors.lightBlue.withOpacity(0.5),
                  height: 40,
                )
              : Container(
                  height: 50,
                ),
          SizedBox(
            height: 20,
          ),
          CustomRaisedButton(
            onPressed: _sendData,
            child: Text("Submit"),
            color: Colors.lightGreen.withOpacity(0.5),
            height: 40,
          ),
        ],
      )),
      defaultActionText: "Cancel",
    );
  }
}
