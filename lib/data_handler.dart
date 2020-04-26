import 'package:flutter/material.dart';

class DataHandler {
  static var timeNow;
  static int day = timeNow.day;
  static int month = timeNow.month;
  static int year = timeNow.year;
  static int hour = TimeOfDay.now().hour;
  static int minutes = TimeOfDay.now().minute;
  static String getCurrentDate(){
    refresh();
    String weekday = intToWeekday();
    String month = intToMonthShort();
    return '$weekday, $day $month $year';
  }
  static String getCurrentDateAndTime(){
    refresh();
    String month = intToMonthLong();
    String minutesAsString = prependZero(minutes);

    return '$day $month $year, $hour:$minutesAsString';
  }
  static String getCurrentTime(){
    refresh();
    String minutesAsString = prependZero(minutes);
    return '$hour:$minutesAsString';
  }
  static String intToMonthShort(){
    refresh();
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
  static String intToMonthLong(){
    refresh();
    String month;
    switch(timeNow.month){
      case 1:
        month = 'January';
        break;
      case 2:
        month = 'February';
        break;
      case 3:
        month = 'March';
        break;
      case 4:
        month = 'April';
        break;
      case 5:
        month = 'May';
        break;
      case 6:
        month = 'June';
        break;
      case 7:
        month = 'July';
        break;
      case 8:
        month = 'August';
        break;
      case 9:
        month = 'September';
        break;
      case 10:
        month = 'October';
        break;
      case 11:
        month = 'November';
        break;
      case 12:
        month = 'December';
        break;
    }
    return month;
  }
  static String intToWeekday(){
    refresh();
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
  static String durationToString(Duration duration){
    int hours = duration.inHours;
    int minutes = duration.inMinutes  -  (hours * 60);

    if(hours>0 && minutes>0)
      return '$hours hour(s), $minutes minute(s)';
    else if(hours==0 && minutes==0)
      return '-';
    else if(hours == 0)
      return '$minutes minutes';
    else
      return '$hours hours';
  }
  static String prependZero(int minutes){
    if(minutes<10)
      return '0'+minutes.toString();
    else
      return minutes.toString();
  }
  static refresh(){
    timeNow = DateTime.now();
    day = timeNow.day;
    month = timeNow.month;
    year = timeNow.year;
    hour = TimeOfDay.now().hour;
    minutes = TimeOfDay.now().minute;
  }
  }

