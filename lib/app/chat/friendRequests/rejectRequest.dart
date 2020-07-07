import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> rejectRequest(friendUid, userUid, Firestore store) async {
  // remove from friend request
  await store.collection("users").document(userUid).updateData({
    "friendrequest_user_uid": FieldValue.arrayRemove([friendUid]),
  });
  return true;
}
