import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class AddPhoto extends StatefulWidget {
  @override
  _AddPhotoState createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  File profilePic;
  final databaseReference = Firestore.instance;
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
    storageReference.ref().child("food/${path.basename(profilePic.path)}");
    StorageUploadTask uploadTask = imageRef.putFile(profilePic);
    await uploadTask.onComplete;
    _imageUrl = await imageRef.getDownloadURL();

    await databaseReference.collection("users").document("diiBEZvWZJd4u7SarzwsW8ucbfZ2").updateData({
      "profilePic": _imageUrl
    });
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: <Widget>[
          profilePic == null
              ? Container(
                  height: 150,
                )
              : Image.asset(profilePic.path),
          profilePic == null
              ? FlatButton(
                  onPressed: _chooseFile, child: Text("Add profile picture"))
              : Container(
                  height: 100,
                ),
          RaisedButton(onPressed: _sendData, child: Text("Submit"),)
        ],
      )),
    );
  }
}
