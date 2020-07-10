import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<bool> addToFriendsList(
    context, friendUid, userUid, Firestore store, bool tutor) async {
  if (tutor) {
    // add to tutor list
    await store.collection("users").document(userUid).updateData({
      "tutors_user_uid": FieldValue.arrayUnion([friendUid]),
    });
    // remove from tutor request
    await store.collection("users").document(userUid).updateData({
      "tutorrequest_user_uid": FieldValue.arrayRemove([friendUid]),
    });
    // add to student's tutorlist
    await store.collection("users").document(friendUid).updateData({
      "tutors_user_uid": FieldValue.arrayUnion([userUid]),
    }).whenComplete(() => Navigator.pop(context));
  } else {
    // add to friend list
    await store.collection("users").document(userUid).updateData({
      "friends_user_uid": FieldValue.arrayUnion([friendUid]),
    });
    // remove from friend request
    await store.collection("users").document(userUid).updateData({
      "friendrequest_user_uid": FieldValue.arrayRemove([friendUid]),
    });
    // add to friend's friendlist
    await store.collection("users").document(friendUid).updateData({
      "friends_user_uid": FieldValue.arrayUnion([userUid]),
    }).whenComplete(() => Navigator.pop(context));
  }
  return true;
}
