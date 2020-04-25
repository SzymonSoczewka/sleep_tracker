
import 'package:flutter/material.dart';
import 'package:sleeptracker/data_handler.dart';
import 'package:sleeptracker/sleep_recordsDB.dart';
import 'model/sleep_record.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Sleep Tracker'),
            centerTitle: true,
          ),
          body: HomePage(title: 'Flutter Demo Home Page')
      ),
    theme: ThemeData.dark(),
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
  //final db = new SleepRecordsDB().sleepRecords;
  List<SleepRecord> sleepRecords = new SleepRecordsDB().getSleepRecords();

  void addRecord() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      sleepRecords.add(
          SleepRecord(sleepDuration: 'x', startingHour: 'x', sleepType: 's'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              child: Image.asset('assets/images/moon.png'),
              height: 100,
            ),
            Container(
              margin: EdgeInsets.all(15.0),
              child: Text(
                'Get to know your baby\'s sleep patterns and keep track of how much sleep they are getting here.',
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 25.0
              ),
              child: AddRecordButton(),
              height: 70,
              width: 350,
            ),
            Container(
              margin: EdgeInsets.only(
                top: 40,
                bottom: 20
              ),
              alignment: Alignment.center,
              child: Text(DataHandler.getCurrentDate(),style: TextStyle(fontSize: 25),),
            ),
            Column(
              children: sleepRecords.map( (record){
                return Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(record.getStartingHour())
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(record.getSleepType()),
                        Text(record.getSleepDuration()),
                      ],
                    )
                  ],
                );
              }).toList(),
            ),
          ],
        )
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

