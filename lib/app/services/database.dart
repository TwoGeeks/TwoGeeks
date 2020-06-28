import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:twoGeeks/app/models/user_profile_model.dart';
import 'package:twoGeeks/app/services/firestore_service.dart';
import 'package:twoGeeks/app/services/api_paths.dart';

abstract class Database {
  // method to add hobby
  Future<void> addHobby(String hobby);

  // get name
//  Future<String> getName();
  Future<dynamic> read(String data);

  Stream<UserProfileModel> getUserProfile();

  // updates the key with a new value
  Future<void> updateProfile(String key, String value);
}

class FireStoreDatabase implements Database {
  String uid;
  final _service = FireStoreService.instance;
  FireStoreDatabase({@required this.uid}) : assert(uid != null);

  Future<void> addHobby(String hobby) async =>
      _service.updateData(path: APIPath.user(uid), data: {
        "hobbies": FieldValue.arrayUnion([hobby])
      });

  Future<void> updateProfile(String key, String value) =>
      _service.updateData(path: APIPath.user(uid), data: {key: value});

  Stream<UserProfileModel> getUserProfile() {
    return _service.documentStream(
        path: APIPath.user(uid),
        builder: (data) => UserProfileModel.fromMap(data));
  }

  Future<dynamic> read(String data) async {
    var document = await Firestore.instance.document(APIPath.user(uid));
    document.get().then((item) => print(item.data[data]));
  }
}
