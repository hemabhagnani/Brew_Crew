import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/services/database.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew/screens/home/brew_list.dart';
class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    print("3rd");
    return StreamProvider<List<Brew>>.value(
      value:DatabaseService().brews,
      initialData: List(),
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          title: Text("Welcome"),
          actions: <Widget>[
            FlatButton.icon(onPressed: () async{ await _auth.signOut();}, icon: Icon(Icons.person), label: Text("Logout"))
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
