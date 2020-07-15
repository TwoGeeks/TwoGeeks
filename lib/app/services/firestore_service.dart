import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class FireStoreService {
  FireStoreService._();
  static final instance = FireStoreService._();

  // returns the stream from a given path in FireStore
  Stream<List<T>> collectionListStream<T>(
      {@required String path, @required T builder(Map<String, dynamic> data)}) {
    final reference = Firestore.instance.collection(path);
    final snapshots = reference.snapshots();
    return snapshots
        .map((event) => event.documents.map((e) => builder(e.data)).toList());
  }

  // returns the stream from a given path in FireStore
  Stream<T> documentStream<T>(
      {@required String path, @required T builder(Map<String, dynamic> data)}) {
    final reference = Firestore.instance.document(path);
    final user = reference.snapshots();
    return user.map((event) => builder(event.data));
  }

  // set data in firestore
  Future<void> setData({String path, Map<String, dynamic> data}) async {
    final documentReference = Firestore.instance.document(path);
    await documentReference.setData(data);
  }

  // update data in firestore
  Future<void> updateData({String path, Map<String, dynamic> data}) async {
    final documentReference = Firestore.instance.document(path);
    await documentReference.updateData(data);
  }

  Future<void> deleteDocument(String path) async {
    final documentReference = Firestore.instance.document(path);
    return await documentReference.delete();
  }

  // get data
  Future<dynamic> get({String path}) async {
    final documentReference = Firestore.instance.document(path);
    final snapshot = await documentReference.get();
    return snapshot.data;
  }
}
