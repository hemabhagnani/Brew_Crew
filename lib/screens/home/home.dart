import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/screens/home/brewlist.dart';
import 'package:brew_crew/screens/home/settings.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    void _showBottomSetting()
    {
        showModalBottomSheet(context: context, builder:(context){
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 60.0,vertical: 20.0),
            child: BottomSetting(),
          );
        });
    }
    return StreamProvider<List<Brew>>.value(
      value: DataBase().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          title: Text("Welcome"),
          actions: <Widget>[
            FlatButton.icon(onPressed: () async{ await _auth.signOut();}, icon: Icon(Icons.person), label: Text("Logout")),
            FlatButton.icon(
                icon: Icon(Icons.settings),
                label: Text('Setting'),
              onPressed: () => _showBottomSetting(),
            )
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
