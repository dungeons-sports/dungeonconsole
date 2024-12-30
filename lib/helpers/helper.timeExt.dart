import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {
  String getDisplayTime() {
    final hour = hourOfPeriod == 0 ? 12 : hourOfPeriod;
    final period = this.period == DayPeriod.am ? 'AM' : 'PM';
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period';
  }
}