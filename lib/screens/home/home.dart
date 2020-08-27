import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text("Welcome"),
        actions: <Widget>[
          FlatButton.icon(onPressed: (){}, icon: Icon(Icons.person), label: Text("Logout"))
        ],
      ),
    );
  }
}
