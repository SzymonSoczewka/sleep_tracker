class DataHandler {
  static String getCurrentDate(){
    var timeNow = DateTime.now();
    String weekday = intToWeekday(timeNow);
    int day = timeNow.day;
    String month = intToMonth(timeNow);
    int year = timeNow.year;

    return '$weekday, $day $month $year';
  }
  static String intToMonth(var timeNow){
    String month;
    switch(timeNow.month){
      case 1:
        month = 'JAN';
        break;
      case 2:
        month = 'FEB';
        break;
      case 3:
        month = 'MAR';
        break;
      case 4:
        month = 'APR';
        break;
      case 5:
        month = 'MAY';
        break;
      case 6:
        month = 'JUNE';
        break;
      case 7:
        month = 'JULY';
        break;
      case 8:
        month = 'AUG';
        break;
      case 9:
        month = 'SEPT';
        break;
      case 10:
        month = 'OCT';
        break;
      case 11:
        month = 'NOV';
        break;
      case 12:
        month = 'DEC';
        break;
    }
    return month;
  }
  static String intToWeekday(var timeNow){
    String weekday;
    switch(timeNow.weekday){
      case 1:
        weekday = 'Monday';
        break;
      case 2:
        weekday = 'Tuesday';
        break;
      case 3:
        weekday = 'Wednesday';
        break;
      case 4:
        weekday = 'Thursday';
        break;
      case 5:
        weekday = 'Firday';
        break;
      case 6:
        weekday = 'Saturday';
        break;
      case 7:
        weekday = 'Sunday';
        break;
    }
    return weekday;
  }
  }
