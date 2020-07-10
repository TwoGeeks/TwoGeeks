import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> rejectRequest(
    friendUid, userUid, Firestore store, bool tutor) async {
  // remove from friend/tutor request
  if (tutor) {
    await store.collection("users").document(userUid).updateData({
      "tutorrequest_user_uid": FieldValue.arrayRemove([friendUid]),
    });
  } else {
    await store.collection("users").document(userUid).updateData({
      "friendrequest_user_uid": FieldValue.arrayRemove([friendUid]),
    });
  }
  return true;
}
