import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth= AuthService();
  final _formKey=GlobalKey<FormState>();
  String email="";
  String password="";
  String error="";
  bool loading=false;
  @override
  Widget build(BuildContext context) {
    return loading? Loading(): Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text("Register"),
        elevation: 0.0,
        backgroundColor: Colors.brown[400],
        actions: <Widget>[
          FlatButton.icon(
              onPressed: (){
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text("Sign In"))
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
                    decoration:textInputDEcoration.copyWith(hintText: "Email"),
                    validator: (val)=>val.isEmpty ? "Please Eneter Email":null,
                    onChanged: (val){
                      setState(()=>email=val);
                    },
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration:textInputDEcoration.copyWith(hintText: "Password"),
                    validator: (val)=>val.length <6 ? "Enter Password greater than 6 characters":null,
                    obscureText: true,
                    onChanged: (val){
                      setState(()=>password=val);
                    },

                  ),
                  SizedBox(height: 10.0),
                  RaisedButton(
                    child: Text("Register"),
                    onPressed: () async {
                      if(_formKey.currentState.validate())
                        {
                          setState(() {
                            loading=true;
                          });
                          dynamic result=await _auth.registerWithEmailandPassword(email:email, password:password);
                          if(result==null)
                            {
                              setState(() {
                                loading=false;
                                error="Some Error occured";
                              });
                            }
                        }
                    },


                  ),
                  SizedBox(height: 10.0),
                  Text(error,
                  style: TextStyle(color: Colors.red),),


                ],
              )
          )
      ),
    );
  }
}
