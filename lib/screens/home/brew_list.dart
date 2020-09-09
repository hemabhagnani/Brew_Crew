import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/screens/home/brew_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    print("4th");
    final brews=Provider.of<List<Brew>>(context) ?? null;
    print("5th");
    int check = brews == null ? 0 : brews .length;
    if(check !=0) {
      brews.forEach((brew) {
        print(brew.name);
        print(brew.strength);
        print(brew.sugars);
      });
    }

      return ListView.builder(
          itemCount: brews.length,
          itemBuilder:(context,index){
            return BrewTile(brew:brews[index]);
          });
    }
  }
