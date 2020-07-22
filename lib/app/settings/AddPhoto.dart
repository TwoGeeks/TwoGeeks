import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:camera/camera.dart';
import 'package:twoGeeks/app/camera/TakeImageWithCamera.dart';
import 'package:twoGeeks/common_widgets/circular_progress_indicator.dart';
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

   List<CameraDescription> _camerasList;
   CameraDescription _operatingCamera;
   bool initialised = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  void _takePhoto(String imgUrl){
    setState(() {
      profilePic = File(imgUrl);
    });
  }

  void _swapCamera(){
    if (_operatingCamera == _camerasList[0] && _camerasList[1] != null){
      setState(() {
        _operatingCamera = _camerasList[1];
      });
    } else {
      setState(() {
        _operatingCamera = _camerasList[0];
      });
    }
  }

  Future<void> _initializeCamera() async {
    WidgetsFlutterBinding.ensureInitialized();
    _camerasList = await availableCameras();
    _operatingCamera = _camerasList.first;
    setState(() {
      initialised = true;
    });
  }


  Future _chooseFile() async {
    await ImagePicker().getImage(source: ImageSource.gallery).then((image) {
      setState(() {
        profilePic = File(image.path);
      });
    });
  }

  void _sendData(BuildContext context) async {
    String _imageUrl;
    StorageReference imageRef =
        storageReference.ref().child("profile/picture/${path.basename(profilePic.path)}");
    StorageUploadTask uploadTask = imageRef.putFile(profilePic);
    await uploadTask.onComplete;
    _imageUrl = await imageRef.getDownloadURL();
    print("image url is " + _imageUrl);
    widget.updateImgUrl(_imageUrl).then((_) => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    if (initialised && profilePic == null){
      return _buildSelectWidget();
    } else if (initialised) {
      return _buildPreviewWidget(context);
    }
    else {
      return TwoGeeksCircularProgressIndicator(
        title: "Please Wait...",
        subtitle: "Camera is Loading",
      );
    }
  }
  Widget _buildSelectWidget(){
    if (profilePic == null) {
      return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            FlatButton(
              child: Text("Upload from Gallery"),
              onPressed: _chooseFile,
//              shape: ShapeBorder.,
              color: Colors.white,
            ),
            SizedBox(width: 20,),
            FlatButton(
              child: Icon(Icons.switch_camera),
              onPressed: _swapCamera,
//              shape: ShapeBorder.,
              color: Colors.white,
            )
          ],
        ),
        body: TakePictureScreen(
          camera: _operatingCamera,
          onClick: _takePhoto,
        ),
      );
    }
  }

  Widget _buildPreviewWidget(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Preview image"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            color: Colors.black,
            child: Center(
              child: Image.file(profilePic),
            )
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FloatingActionButton(
                child: Icon(Icons.check),
                backgroundColor: Colors.green,
                onPressed: () => _sendData(context),
              ),
              FloatingActionButton(
                backgroundColor: Colors.red,
                child: Icon(Icons.clear),
                onPressed: () => Navigator.pop(context),
              )
            ],
          )
        ],
      ),
    );
  }
}

//return PlatformAlertDialog(
//title: Text("Add a photo"),
//content: Center(
//child: Column(
//children: <Widget>[
//profilePic == null
//? Container(
//height: 150,
//)
//: Container(
//child: Image.asset(profilePic.path),
//margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
//),
//profilePic == null
//? Column(
//children: <Widget>[
//CustomFlatButton(
//onPressed: _chooseFile,
//child: Text("Add profile picture"),
//color: Colors.lightBlue.withOpacity(0.5),
//height: 40,
//),
//SizedBox(height: 15,),
//Text("or", style: TextStyle(
//fontSize: 15,
//),
//textAlign: TextAlign.center,
//),
//SizedBox(height: 15,),
//CustomFlatButton(
//onPressed: _chooseFile,
//child: Text("Add profile picture"),
//color: Colors.lightBlue.withOpacity(0.5),
//height: 40,
//),
//],
//)
//: CustomRaisedButton(
//onPressed: _sendData,
//child: Text("Submit"),
//color: Colors.lightGreen.withOpacity(0.5),
//height: 40,
//),
//SizedBox(
//height: 20,
//),
//],
//)),
//defaultActionText: "Cancel",
//);