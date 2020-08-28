import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth= AuthService();
  String email="";
  String password="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text("Sign In"),
        elevation: 0.0,
        backgroundColor: Colors.brown[400],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical:9.0 ,horizontal:10.0 ),
        child: Form(
          child:Column(
            children: <Widget>[
              TextFormField(
                obscureText: true,
                onChanged: (val){
                  setState(()=>email=val);
                },
              ),
              TextFormField(
              obscureText: true,
                onChanged: (val){
                setState(()=>password=val);
                },

              ),
              RaisedButton(
                child: Text("Sign In"),
                onPressed: (){
                  print(email);
                  print(password);
                },
              )

            ],
          )
        )
      ),
    );
  }
}
