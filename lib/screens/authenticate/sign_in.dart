import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constants.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth= AuthService();
  final _formkey = GlobalKey<FormState>();
  String email="";
  String password="";
  String error = '';
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
          key: _formkey,
          child:Column(
            children: <Widget>[
              SizedBox(height: 10.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val){
                  setState(()=>email=val);
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
              obscureText: true,
                validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (val){
                setState(()=>password=val);
                },

              ),
              SizedBox(height: 10.0),
              RaisedButton(
                child: Text("Sign In"),
                onPressed: () async {
                  if(_formkey.currentState.validate()){
                    dynamic result = await _auth.signinWithEmailandPassword(email, password);
                    if(result == null)
                      {
                        setState(() {
                          error = '*could not sign in with those credentials.';
                        });
                      }
                  }
                },
              ),
              Text(
                error,
                style: TextStyle(color: Colors.red,fontSize: 14.0),
              ),
            ],
          )
        )
      ),
    );
  }
}
