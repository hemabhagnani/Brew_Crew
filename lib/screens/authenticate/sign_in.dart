import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth= AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text("welcome"),
        elevation: 0.0,
        backgroundColor: Colors.brown[400],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical:9.0 ,horizontal:10.0 ),
        child: RaisedButton(
          child: Text("Sign In"),
          onPressed: () async {
            dynamic result=await _auth.signInAnon();
            if(result==null)
              {
                print("Error signing in");
              }
            else
              {
                print("Signed in");
                print(result);
              }
          },
        ),
      ),
    );
  }
}