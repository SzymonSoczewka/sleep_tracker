
import 'package:flutter/material.dart';
import 'package:sleeptracker/data_handler.dart';
import 'package:sleeptracker/model/sleep_record.dart';
import 'package:sleeptracker/model/sleep_recordsDB.dart';
import 'package:sleeptracker/views/new_record_view.dart';

void main() => runApp(MainView());

class MainView extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Sleep Tracker'),
            centerTitle: true,
            backgroundColor: Colors.amber[400],
          ),
          body: HomePage(title: 'RB'),
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
  List<SleepRecord> sleepRecords = [];

    void addRecord(BuildContext context) async {

     DataHandler.refresh();
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddRecordView()),
    );
    setState(() {
     sleepRecords.add(result);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListView(
          children: <Widget>[
            MainPicture(),
            Introduction(),
            Container(
              margin: EdgeInsets.only(
                  top: 25.0
              ),
              child: RaisedButton(
                onPressed: (){
                  addRecord(context);
                },
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
                color: Colors.blueAccent,
              ),
              height: 70,
              width: 350,
            ),
            PresentDate(),
            RecordsList(sleepRecords: sleepRecords,),
          ],
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
class Introduction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Container(
     margin: EdgeInsets.all(15.0),
     child: Text(
       'Get to know your baby\'s sleep patterns and keep track of how much sleep they are getting here.',
       style: TextStyle(
         fontSize: 20,
       ),
       textAlign: TextAlign.center,
     ),
   );
  }

}
class PresentDate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: 40,
          bottom: 20
      ),
      alignment: Alignment.center,
      child: Text(DataHandler.getCurrentDate(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
    );
  }

}
class RecordsList extends StatelessWidget {
  RecordsList({Key key, this.sleepRecords}) : super(key: key);
  List<SleepRecord> sleepRecords = new SleepRecordsDB().getSleepRecords();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: sleepRecords.reversed.map( (record){
        return Container(
          margin: EdgeInsets.only(
              left: 5,
              right: 5
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2, // 20%
                child: Container(
                  child: Text(
                    record.getStartingHour(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
                  ),
                  decoration: new BoxDecoration(
                    color: Colors.grey[100],
                  ),
                  height: 50,
                  alignment: Alignment.center,
                ),
              ),
              Expanded(
                flex: 8, // 60%
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        record.getSleepType(),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 24,color: Colors.blueAccent),
                      ),
                      Text(
                        record.getSleepDuration(),
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
            ),),
        );
      }).toList(),
    );
  }

}
