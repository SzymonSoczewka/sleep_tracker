import 'package:flutter/material.dart';

class DataHandler {
  static var timeNow = DateTime.now();
  static int day = timeNow.day;
  static int month = timeNow.month;
  static int year = timeNow.year;
  static int hour = TimeOfDay.now().hour;
  static int minutes = TimeOfDay.now().minute;
  static String getCurrentDate(){
    String weekday = intToWeekday();
    String month = intToMonthShort();
    return '$weekday, $day $month $year';
  }
  static String getCurrentDateAndTime(){
    String month = intToMonthLong();
    return '$day $month $year, $hour:$minutes';
  }
  static String intToMonthShort(){
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
