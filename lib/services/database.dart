import 'package:brew_crew/models/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  //reference to collection
  final String uid;
  //uid links the firebase user uid to the key to userdatabse
  DatabaseService({this.uid});
  final CollectionReference brewCollection=Firestore.instance.collection("brews");
  Future updateUserDatabase(String sugars,String name, int strength) async{
    //create a new document using uid as key
    return await brewCollection.document(uid).setData(
        {'sugars': sugars,
          'name': name,
          'strength': strength,
        }
    );
  }
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot)
  {
    return snapshot.documents.map((doc) {
      return Brew(
          name:doc.data['name'] ?? '',
          strength: doc.data['strength'] ?? 0,
          sugars: doc.data['sugars'] ?? "0"
      );
    }).toList();
  }
  Stream<List<Brew>> get brews{
    return brewCollection.snapshots().map(_brewListFromSnapshot);
}
}