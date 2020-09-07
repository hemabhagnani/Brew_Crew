import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  //reference to collection
  final String uid;
  //uid links the firebase user uid to the key to userdatabse
  DatabaseService({this.uid});
  final CollectionReference brewCollection=Firestore.instance.collection("brews");
  Future updateUserDatabase(String sugars,String name, String strength) async{
    //create a newdocument using uid as key
    return await brewCollection.document(uid).setData(
        {'sugar': sugars,
          'name': name,
          'strength': strength,
        }
    );
  }
  Stream<QuerySnapshot> get brews{
    return brewCollection.snapshots();
}
}