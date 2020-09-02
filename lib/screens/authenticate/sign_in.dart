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
  final _formKey=GlobalKey<FormState>();
  String email="";
  String password="";
  String error="";
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
            key:_formKey,
          child:Column(
            children: <Widget>[
              SizedBox(height: 10.0),
              TextFormField(
                validator: (val)=>val.isEmpty ? "Please Eneter Email":null,
                onChanged: (val){
                  setState(()=>email=val);
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                validator: (val)=>val.length <6 ? "Enter Password":null,
              obscureText: true,
                onChanged: (val){
                setState(()=>password=val);
                },

              ),
              SizedBox(height: 10.0),
              RaisedButton(
                child: Text("Sign In"),
                onPressed: (){
                  if(_formKey.currentState.validate())
                  {
                    dynamic result=_auth.signInWithEmailandPassword(email:email, password:password);
                    if(result==null)
                    {
                      setState(() {
                        error="Some Error occured";
                      });
                    }
                  }
                },
              ),
              SizedBox(height: 10.0),
              Text(error),

            ],
          )
        )
      ),
    );
  }
}
