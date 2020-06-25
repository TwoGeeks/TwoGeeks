import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:twoGeeks/app/detail/detailInfo/hobbies.dart';
import 'package:twoGeeks/app/services/api_paths.dart';

abstract class Database{
  // method to add hobby
  Future<void> addHobby(String hobby);
}

class FireStoreDatabase implements Database{
  String uid;
  FireStoreDatabase({@required this.uid}) : assert(uid != null);

  Future<void> addHobby(String hobby) async => updateData(
    path: APIPath.user(uid),
  data: {"hobbies" : FieldValue.arrayUnion([hobby])}
  );

  // set data in firestore
  Future<void> setData({String path, Map<String, dynamic> data}) async{
    final documentReference = Firestore.instance.document(path);
    await documentReference.setData(data);
  }

  // update data in firestore
  Future<void> updateData({String path, Map<String, dynamic> data}) async{
    final documentReference = Firestore.instance.document(path);
    await documentReference.updateData(data);
  }
}