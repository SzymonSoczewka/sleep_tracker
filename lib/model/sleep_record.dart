
class SleepRecord {
  // Properties (Instance Variables)
  String sleepType;
  String startingHour;
  String sleepDuration;
  // Constructor
  SleepRecord({this.sleepType, this.startingHour, this.sleepDuration});
  // Getters and Setters
  String getSleepType(){
    return sleepType;
  }
  String getStartingHour(){
    return startingHour;
  }
  String getSleepDuration(){
    return sleepDuration;
  }
  void setSleepType(String _sleepType){
    this.sleepType = _sleepType;
  }
  void setStaringHour(String _startingHour){
    this.sleepType = _startingHour;
  }
  void setSleepDuration(String _sleepDuration){
    this.sleepDuration = _sleepDuration;
  }
  // Methods (Functions)

}