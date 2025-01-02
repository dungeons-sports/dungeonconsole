import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dungeonconsole/main.dart';
import 'package:dungeonconsole/models/modelBooking/model.booking.dart';
import 'package:dungeonconsole/models/modelConsole/model.console.dart';
import 'package:dungeonconsole/services/service.firestore.dart';
import 'package:flutter/material.dart';

class VMCreateBooking extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _showBookingCompleteDialog = false;
  bool get showBookingCompleteDialog => _showBookingCompleteDialog;

  ConsoleCategory _selectedCategory = ConsoleCategory.pc;
  ConsoleCategory get selectedCategory => _selectedCategory;

  late Booking? createdBooking;

  TimeOfDay? _selectedStartTime;
  TimeOfDay? _endTime;

  int _selectedDuration = 1;

  List<String> hoursList = [
    "1 hour",
    "2 hour",
    "3 hour",
    "4 hour",
    "5 hour",
    "6 hour",
    "7 hour",
    "8 hour",
    "9 hour"
  ];

  set selectedCategory(ConsoleCategory category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void setSelectedCategory(int index) {
    switch (index) {
      case 0:
        selectedCategory = ConsoleCategory.pc;
        break;
      case 1:
        selectedCategory = ConsoleCategory.ps;
        break;
      case 2:
        selectedCategory = ConsoleCategory.xbox;
        break;
      case 3:
        selectedCategory = ConsoleCategory.vr;
        break;
      case 4:
        selectedCategory = ConsoleCategory.streaming;
        break;
      case 5:
        selectedCategory = ConsoleCategory.simRacing;
        break;
    }
  }

  void updateSelectedStartTime(TimeOfDay? time) {
    _selectedStartTime = time;
  }

  void updateDuration(String durationStr) {
    // Check if the selectedStartTime is not null.
    _selectedStartTime ??= TimeOfDay.now();
    _selectedDuration = int.parse(durationStr.split(" ")[0]);
  }

  void createBooking(String cafeId) async {
    if (_isLoading) {
      return;
    }
    try {
      _isLoading = true;
      notifyListeners();
      // If start time is not selected.
      _selectedStartTime ??= TimeOfDay.now();

      _endTime = TimeOfDay(
        hour: _selectedStartTime!.hour + _selectedDuration,
        minute: _selectedStartTime!.minute,
      );

      Timestamp startTime = Timestamp.fromDate(DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        _selectedStartTime!.hour,
        _selectedStartTime!.minute,
      ));

      Timestamp endTime = Timestamp.fromDate(DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        _endTime!.hour,
        _endTime!.minute,
      ));

      Booking? createdBooking = await locator
          .get<FirestoreService>()
          .createBooking(cafeId, _selectedCategory, startTime, endTime);

      if (createdBooking != null) {
        _showBookingCompleteDialog = true;
      }

      _isLoading = false;
      notifyListeners();

      Timer(const Duration(seconds: 2), () {
        _showBookingCompleteDialog = false;
      });
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
