import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

import 'package:image_cropper/image_cropper.dart';

class PictureCropper extends StatefulWidget {
  final String title;
  final File imageFile;
  @required final Function onSubmit;
  @required final Function onCancel;
  PictureCropper({this.title, this.imageFile, this.onSubmit, this.onCancel});

  @override
  _PictureCropperState createState() => _PictureCropperState();
}

class _PictureCropperState extends State<PictureCropper> {
  File imageFile;
  File cropped;

  @override
  void initState() {
    super.initState();
    imageFile = widget.imageFile;
    cropped = imageFile;
    _cropImage();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
            color: Colors.grey,
            child: Center(
              child: Image.file(cropped),
            )),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FloatingActionButton(
              child: Icon(Icons.check),
              backgroundColor: Colors.green,
              onPressed: () => widget.onSubmit(cropped),
            ),
            FloatingActionButton(
              child: Icon(Icons.crop),
              backgroundColor: Colors.brown.withOpacity(0.9),
              onPressed: () => _cropImage(),
            ),
            FloatingActionButton(
                backgroundColor: Colors.red,
                child: Icon(Icons.clear),
                onPressed: widget.onCancel
            ),
          ],
        )
      ],
    );
  }

  Future<Null> _cropImage() async {
    File croppedFile = await ImageCropper.cropImage(
        sourcePath: imageFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Photo Cropper',
            toolbarColor: Colors.black,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          title: 'Photo Cropper',
        ));
    if (croppedFile != null) {
      setState(() {
        cropped = croppedFile;
      });
    }
  }
}
