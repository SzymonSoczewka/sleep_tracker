import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleeptracker/model/sleep_record.dart';
import 'package:sleeptracker/model/sleep_recordsDB.dart';

import '../data_handler.dart';

void main() => runApp(AddRecordView());
class AddRecordView extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sleep Tracker'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: HomePage(title: 'Flutter Demo Home Page'),

      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {


  void addRecord() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.

    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListView(
          children: <Widget>[
            MainPicture(),
            Container(
              margin: EdgeInsets.only(
                  top: 25.0
              ),
              child: RaisedButton(
                onPressed: addRecord,
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
              ),
              height: 70,
              width: 350,
            ),
    ]
    )
    );
  }

}

class MainPicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Image.asset('assets/images/moon.png'),
      height: 100,
    );
  }

}
