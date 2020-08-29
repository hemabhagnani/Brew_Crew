import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
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
        actions: <Widget>[
          FlatButton.icon(
              onPressed: (){
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text("Resgister"))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical:9.0 ,horizontal:20.0 ),
        child: Form(
          child:Column(
            children: <Widget>[
              SizedBox(height: 10.0),
              TextFormField(

                onChanged: (val){
                  setState(()=>email=val);
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
              obscureText: true,
                onChanged: (val){
                setState(()=>password=val);
                },

              ),
              SizedBox(height: 10.0),
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
