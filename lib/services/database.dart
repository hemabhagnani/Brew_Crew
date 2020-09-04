import 'package:cloud_firestore/cloud_firestore.dart';

class DataBase {
  String uid;
  DataBase({ this.uid });

  final brews = Firestore.instance.collection('brews');

  Future updateUserData(String sugar , String name , int strength)
  {
    return brews.document(uid).setData( {
      'sugar' : sugar,
      'name' : name,
      'strength' : strength
    });
  }
}