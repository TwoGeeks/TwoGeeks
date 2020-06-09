import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:twoGeeks/env/config.dart';

Firestore getFirestoreInstance(context) {
  if (AppConfig.of(context).test == true) {
    return MockFirestoreInstance();
  } else {
    return Firestore.instance;
  }
}