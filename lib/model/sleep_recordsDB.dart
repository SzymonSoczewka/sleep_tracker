
import 'package:sleeptracker/model/sleep_record.dart';

class SleepRecordsDB {
  List<SleepRecord> sleepRecords = [
    SleepRecord(sleepType: 'sleepType',startingHour: '10:30',sleepDuration: '14'),
    SleepRecord(sleepType: 'sleepType',startingHour: '12:30',sleepDuration: '14'),
    SleepRecord(sleepType: 'sleepType',startingHour: '14:30',sleepDuration: '14')
  ];
  List<SleepRecord> getSleepRecords(){
    return sleepRecords;
  }
}