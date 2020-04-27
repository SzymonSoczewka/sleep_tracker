import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleeptracker/model/sleep_record.dart';
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
          backgroundColor: Colors.amber[400],
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context,false),
          ),
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
  String currentSleepType= '-';
  String currentDuration = '-';
  List<String> sleepTypes = ['Nap', 'Night\'s sleep'];
  bool durationPicked = false;
  bool sleepTypePicked = false;

  void showDurationDialog() {
    var alertDialog = CupertinoAlertDialog(
      title: Text('Select sleep duration:',textAlign: TextAlign.center,),
      content: CupertinoTimerPicker(
          mode: CupertinoTimerPickerMode.hm,
          onTimerDurationChanged: (value){
            setState(() {
              String duration = DataHandler.durationToString(value);
              currentDuration = duration;
                if(duration.length>1) {
                  durationPicked = true;
                }
                else{
                  durationPicked = false;
                }
            });
          }
      ),
      actions: <Widget>[
        ClosingButton(),
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context){
        return alertDialog;
      }
    );
  }
  void showSleepTypeDialog(){
    var alertDialog = new CupertinoAlertDialog(
      title: Text('Select sleep type:'),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text('Nap'),
          onPressed: () => setState(() {
          currentSleepType = sleepTypes[0];
          sleepTypePicked = true;
          Navigator.of(context, rootNavigator: true).pop();
          }),
        ),
        CupertinoDialogAction(
          child: Text('Night\'s sleep'),
          onPressed: () => setState(() {
            currentSleepType = sleepTypes[1];
            sleepTypePicked = true;
            Navigator.of(context, rootNavigator: true).pop();
          }),
        ),
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context){
          return alertDialog;
        }
    );

  }
  void showErrorDialog(){
    var alertDialog = new CupertinoAlertDialog(
      title: Text(
          'Error',
          style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Text(
          'If you want to create new sleep record, select sleep type and duration.',
          style: TextStyle(fontSize: 20),
      ),
      actions: <Widget>[
        CupertinoDialogAction(
          child: ClosingButton(),
        )
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context){
          return alertDialog;
        }
    );
  }
  void executeSave(){
    if(durationPicked && sleepTypePicked) {
      DataHandler.refresh();
      Navigator.of(context, rootNavigator: true).pop(
          new SleepRecord(
              startingHour: DataHandler.getCurrentTime(),
              sleepType: currentSleepType,
              sleepDuration: currentDuration
          )
      );
    }
    else
      showErrorDialog();

  }

    @override
    Widget build(BuildContext context) {
      return Card(
          child: ListView(
            children: <Widget>[
              MainPicture(),
              Column(
                children: <Widget>[
                  DateAndTimeRow(),
                  InkWell(
                    onTap: showSleepTypeDialog,
                    child: SleepTypeRow(currentSleepType: currentSleepType,),
                  ),
                  InkWell(
                    onTap: showDurationDialog,
                    child: DurationRow(currentDuration: currentDuration,),
                  ),
                ],
              ),
              saveButton()
            ],
          )
      );
    }

    Container saveButton() {
      return Container(
              margin: EdgeInsets.only(
                  top: 60.0
              ),
              child: RaisedButton(
                onPressed: executeSave,
                child: Text(
                  'Save',
                  style: TextStyle(
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
class DateAndTimeRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Container(
     child: Row(
       children: <Widget>[
         Expanded(
           flex: 2,
           child: Image.asset('assets/images/calendar.png',height: 40,color: Colors.blueAccent,),
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
                   style: TextStyle(fontSize: 24,color: Colors.blueAccent),
                 ),
                 Text(
                   DataHandler.getCurrentDateAndTime(),
                   textAlign: TextAlign.center,
                   style: TextStyle(fontSize: 18,color: Colors.black87),
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
   );
  }

}
class SleepTypeRow extends StatelessWidget{
  SleepTypeRow({Key key, this.currentSleepType}) : super(key: key);
  final String currentSleepType;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Image.asset(
                'assets/images/sleep.png',
                color: Colors.blueAccent,
                height: 40,
              ),
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
                      style: TextStyle(
                          fontSize: 24, color: Colors.blueAccent),
                    ),
                    Text(
                      currentSleepType,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18,
                          color: Colors.black87),
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
    );
  }

}
class DurationRow extends StatelessWidget{
  DurationRow({Key key, this.currentDuration}) : super(key: key);
  final String currentDuration;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Image.asset(
                  'assets/images/clock.png', color: Colors
                    .blueAccent, height: 40,)),
            Expanded(
              flex: 8, // 60%
              child: Container(
                margin: EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Sleep duration',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24, color: Colors.blueAccent),
                    ),
                    Text(
                      currentDuration,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18,
                          color: Colors.black87),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        decoration: new BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 0.1,
          ),)
    );
  }

}
class ClosingButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: 20,
          right:20
      ),
      child: RaisedButton(
        color: Colors.blueAccent,
        onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
        child: Text(
            'Close',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white)),
      ),
    );
  }

}