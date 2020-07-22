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
   bool _initialised = false;
   bool _isLoading = false;

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
      _initialised = true;
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
    setState(() {
      _isLoading = true;
    });
    StorageReference imageRef =
        storageReference.ref().child("profile/picture/${path.basename(profilePic.path)}");
    StorageUploadTask uploadTask = imageRef.putFile(profilePic);
    await uploadTask.onComplete;
    _imageUrl = await imageRef.getDownloadURL();
    widget.updateImgUrl(_imageUrl).then((_) => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    if (_initialised && profilePic == null){
      return _buildSelectWidget();
    } else if (_initialised) {
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
          backgroundColor: Colors.black,
          actions: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
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
                    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0)),
                    color: Colors.white,
                  )
                ],
              ),
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Preview image"),
      ),
      body: !_isLoading
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            color: Colors.grey,
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
                onPressed: () => {
                  setState(() {
                    profilePic = null;
                  })
                },
              )
            ],
          )
        ],
      )
      : Container(
        color: Colors.white,
        child: TwoGeeksCircularProgressIndicator(
          title: "Please wait...",
          subtitle: "Photo is being uploaded",
          titleColor: Colors.black,
          subtitleColor: Colors.black54,
        ),
      ),
    );
  }
}