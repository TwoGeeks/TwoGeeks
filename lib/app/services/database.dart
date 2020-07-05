import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:twoGeeks/app/models/user_model.dart';
import 'package:twoGeeks/app/services/firestore_service.dart';
import 'package:twoGeeks/app/services/api_paths.dart';

abstract class Database {

  //  Future<String> getName();
  Future<dynamic> read(String data);

  Stream<UserModel> getUserProfile();

  // updates the key with a new value
  Future<void> updateProfile(String key, dynamic value);

  // updates preferences
  Future<void> updatePreferences(String key, dynamic value);
}

class FireStoreDatabase implements Database {
  String uid;
  final _service = FireStoreService.instance;
  FireStoreDatabase({@required this.uid}) : assert(uid != null);

  Future<void> updateProfile(String key, dynamic value) =>
      _service.updateData(path: APIPath.user(uid), data: {key: value});

  Future<void> updatePreferences(String key, dynamic value) =>
      _service.updateData(path: APIPath.user(uid), data: {"preferences": {key: value}});

  Stream<UserModel> getUserProfile() {
    return _service.documentStream(
        path: APIPath.user(uid),
        builder: (data) => UserModel.fromMap(data));
  }

  Future<dynamic> read(String data) async {
    var document = await Firestore.instance.document(APIPath.user(uid));
    document.get().then((item) => print(item.data[data]));
  }
}
