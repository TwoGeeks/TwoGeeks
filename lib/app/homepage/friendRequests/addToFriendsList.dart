import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<bool> addToFriendsList(context, friendUid, userUid) async {
  // add to friend list
  await Firestore.instance.collection("users").document(userUid).updateData({
    "friends_user_uid": FieldValue.arrayUnion([friendUid]),
  }).whenComplete(() => Navigator.pop(context));
  // remove from friend request
  await Firestore.instance.collection("users").document(userUid).updateData({
    "friendrequest_user_uid": FieldValue.arrayRemove([friendUid]),
  });
  return true;
}
