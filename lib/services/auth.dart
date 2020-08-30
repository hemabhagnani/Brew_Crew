import 'package:brew_crew/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  //create user obj from FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user)
  {
    return user!= null ? User(Uid:user.uid):null;
  }
  //create Stream of Firebase Users
  Stream<User> get user{
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user)=>_userFromFirebaseUser(user));
    .map(_userFromFirebaseUser);
  }
  //sign in anon
  Future signInAnon() async{
    try{
      AuthResult result=await _auth.signInAnonymously();
      FirebaseUser user=result.user;
      return _userFromFirebaseUser(user);
    }catch(e)
    {
      print(e.toString());
      return null;
    }
  }

  // register via email and password
  Future registerWithEmailandPassword (String email , String password ) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e)
    {
      print(e.toString());
      return null;
    }
  }

  //logout
  Future signOut() async {
    try{
      return _auth.signOut();
    }catch(e)
    {
      print(e.toString());
      return null;
    }
  }
}