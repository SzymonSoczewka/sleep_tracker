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
            Column(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Image.asset('assets/images/calendar.png',height: 40,),
                      ),
                      Expanded(
                        flex: 8, // 60%
                        child: Container(
                          margin: EdgeInsets.all(15),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Date and time',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 24,color: Colors.green),
                              ),
                              Text(
                                DataHandler.getCurrentDateAndTime(),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18,color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  decoration: new BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 0.1,
                    ),) ,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Image.asset('assets/images/sleep.png',color: Colors.green,height: 40,),
                      ),
                      Expanded(

                        flex: 8, // 60%
                        child: Container(
                          margin: EdgeInsets.all(15),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Sleep type',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 24,color: Colors.green),
                              ),
                              Text(
                                'Nap',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18,color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                    decoration: new BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 0.1,
                      ),)
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 2,
                          child: Image.asset('assets/images/clock.png',color: Colors.green, height: 40,)),
                      Expanded(

                        flex: 8, // 60%
                        child: Container(
                          margin: EdgeInsets.all(15),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Sleep duration',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 24,color: Colors.green),
                              ),
                              Text(
                                '4 Hours 34 Minutes',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18,color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                    decoration: new BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 0.1,
                      ),)
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 60.0
              ),
              child: RaisedButton(
                onPressed: addRecord,
                child: Text(
                  'Save',
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
    ],
    )
    );
  }

}

class MainPicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 10.0,
        left: 10.0,
        top: 10.0,
        bottom: 35.0
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.asset(
          'assets/images/baby2.jpeg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
