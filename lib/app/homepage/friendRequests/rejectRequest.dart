import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> rejectRequest(friendUid, userUid) async {
  // remove from friend request
  await Firestore.instance.collection("users").document(userUid).updateData({
    "friendrequest_user_uid": FieldValue.arrayRemove([friendUid]),
  });
  return true;
}
