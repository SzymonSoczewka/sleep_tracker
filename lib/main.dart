

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    theme: ThemeData.dark(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sleep Tracker'),
        centerTitle: true,
      ),
      body: Introduction()
    );
  }
}


class Introduction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(

      child: Column(
        children: <Widget>[
          Image.asset('assets/images/moon.png'),
          Container(
            margin: EdgeInsets.all(15.0),
            child: Text(
              'Get to know your baby\'s sleep patterns and keep track of how much sleep they are getting here.',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: 25.0
            ),
            child: AddRecordButton(),
            height: 70,
            width: 350,
          )
        ],
      ),
    );
  }
}

class AddRecordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {},
      child: Text(
        'Add new sleeping record',
        style:TextStyle(
            fontSize: 20,
            color: Colors.white
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(45.0),
      ),
      color: Colors.green,
    );
  }
}

