import 'package:brew_crew/shared/constants.dart';
import 'package:flutter/material.dart';

class BottomSetting extends StatefulWidget {
  @override
  _BottomSettingState createState() => _BottomSettingState();
}

class _BottomSettingState extends State<BottomSetting> {
  final _formkey = GlobalKey<FormState>();
  final List<String> sugars = ['0','1','2','3','4'];
  String _currentUserName;
  String _currentsugar;
  int _currentstrength;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formkey,
        child: Column(
          children: <Widget>[
            Text(
                'UPDATE YOURS DATA',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0
              ),
            ),
            SizedBox(height: 20.0,),
            TextFormField(
              decoration: textInputDecoration,
              validator: (val) => val.isEmpty? 'Enter Your Name' : null ,
              onChanged: (val){
                setState(()=> _currentUserName =val);
              },
            ),
            SizedBox(height: 20.0,),
            DropdownButtonFormField(
              value: _currentsugar ?? '0',
              items: sugars.map((sugar){
                return DropdownMenuItem(
                  value: sugar,
                    child: Text('$sugar sugars')
                );
              }).toList(),
              onChanged: (val) => setState(() => _currentsugar = val),
            ),
            SizedBox(height: 20.0,),
            Slider(
                value: (_currentstrength ?? 100).toDouble(),
                min: 100.0,
                max: 900.0,
                divisions: 8,
                onChanged: (val) => setState(() => _currentstrength = val.round()),
                activeColor: Colors.brown[_currentstrength],
            ),
            RaisedButton(
                child: Text("update"),
                onPressed: () {

                }
            ),
          ],
        ),
      ),
    );
  }
}
