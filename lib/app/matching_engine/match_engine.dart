import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:twoGeeks/app/models/user_model.dart';
import 'package:twoGeeks/app/services/database.dart';

class MatchEngine {

  final Geolocator _geolocator = Geolocator()..forceAndroidLocationManager;
  final _firestore = Firestore.instance;
  static Database _database;
  Map<String, dynamic> _preferences;
  Position _position;
  String _locality;
  String _country;

  MatchEngine._();
  static final instance = MatchEngine._();

  void initialise(String id){
    _database = FireStoreDatabase(uid: id);
  }

  Future<Position> _getCurrentLocation() {
    return _geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  }

  void _updateUserLocation(Placemark placemark){
    _locality = placemark.locality;
    _country = placemark.country;
    _database.updateLocation("country", placemark.country);
    _database.updateLocation("locality", placemark.locality);
    _database.updateLocation("longitude", placemark.position.longitude);
    _database.updateLocation("latitude", placemark.position.latitude);
  }

  Future<List<String>> match() async{
    GeolocationStatus geolocationStatus  = await Geolocator().checkGeolocationPermissionStatus();
    if (geolocationStatus != GeolocationStatus.granted) {
      throw new LocationNotEnabledException("location service is not enabled");
    } else {

        await _getCurrentLocation().then((value) => _position = value);
        await _geolocator.placemarkFromPosition(_position).then((value) => _updateUserLocation(value[0]));
        await _database.get("preferences").then((value) => _preferences = value);

        List<String> results = [];
        List friendsLst = await _database.get("friends-user-uid");

        var query = _firestore.collection("users")
            .where("country",isEqualTo: _country)
            .where("locality",isEqualTo: _locality)
            .where("preferences",arrayContains: {"currentSchoolYear":_preferences["currentSchoolYear"]});

        await query.getDocuments()
            .then((value) => value.documents)
            .then((value) => value.forEach((element) {
              if(!friendsLst.contains(element.data["friends-user-uid"])){
                results.add(element.documentID);
              }
        }));
        return results;
    }
  }
}

class LocationNotEnabledException implements Exception{
  String msg;
  LocationNotEnabledException(this.msg);
}