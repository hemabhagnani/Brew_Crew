import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  //reference to collection
  final CollectionReference brewCollection=Firestore.instance.collection("brews");
}