import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

extension TimeOfDayExtension on TimeOfDay {
  String getDisplayTime() {
    final hour = hourOfPeriod == 0 ? 12 : hourOfPeriod;
    final period = this.period == DayPeriod.am ? 'AM' : 'PM';
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period';
  }
}

class TimestampConverter implements JsonConverter<Timestamp, Object> {
  const TimestampConverter();

  @override
  Timestamp fromJson(Object json) {
    if (json is int) {
      return Timestamp.fromMillisecondsSinceEpoch(json);
    } else if (json is Timestamp) {
      return json;
    } else {
      throw const FormatException('Invalid type for Timestamp');
    }
  }

  @override
  Object toJson(Timestamp timestamp) => timestamp.millisecondsSinceEpoch;
}