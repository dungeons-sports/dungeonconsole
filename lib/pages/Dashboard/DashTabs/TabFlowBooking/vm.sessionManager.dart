import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dungeonconsole/main.dart';
import 'package:dungeonconsole/models/modelConsole/model.console.dart';
import 'package:dungeonconsole/services/service.firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class VMSessionManager extends ChangeNotifier {
  final String cafeId;

  ConsoleCategory _selectedCategory = ConsoleCategory.ps;
  final Map<String, DateTime?> _startTimes = {};
  final Map<String, Duration> _progressTimes = {};
  final Map<String, Timer?> _timers = {};

  bool _showBookingCompleteDialog = false;

  VMSessionManager({required this.cafeId});

  bool get showBookingCompleteDialog => _showBookingCompleteDialog;

  ConsoleCategory get selectedCategory => _selectedCategory;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool checkCosoleStatus(String consoleId) {
    return _timers[consoleId] != null;
  }

  void setSelectedCategory(int index) {
    switch(index){
        case 0:
          _selectedCategory = ConsoleCategory.pc;
          break;
        case 1:
           _selectedCategory = ConsoleCategory.ps;
          break;        
        case 2:
           _selectedCategory = ConsoleCategory.xbox;
          break;
          case 3:
           _selectedCategory = ConsoleCategory.vr;
          break;
        case 4:
          _selectedCategory = ConsoleCategory.streaming;
          break;
        case 5:
           _selectedCategory = ConsoleCategory.simRacing;
          break;          
      }
    notifyListeners();
  }

  void startTimer(String consoleId) {
    if (_timers[consoleId] != null) return; // Prevent multiple timers

    _startTimes[consoleId] = DateTime.now();
    _progressTimes[consoleId] = Duration.zero;

    _timers[consoleId] = Timer.periodic(const Duration(seconds: 1), (_) {
      final startTime = _startTimes[consoleId];
      if (startTime != null) {
        _progressTimes[consoleId] = DateTime.now().difference(startTime);
        notifyListeners();
      }
    });
  }

  void stopTimer(String consoleId) {
    if (_timers[consoleId] != null) {
      _timers[consoleId]!.cancel();
      _timers[consoleId] = null;

      DateTime startTime = _startTimes[consoleId] ?? DateTime.now();
      DateTime endTime = DateTime.now();
      
      addSessionDetails(
        Timestamp.fromDate(startTime),
        Timestamp.fromDate(endTime),
      );

      _showBookingCompleteDialog = true;
      notifyListeners();
    }
  }

  Duration getProgressTime(String consoleId) {
    return _progressTimes[consoleId] ?? Duration.zero;
  }

  void clearDialog() {
    _showBookingCompleteDialog = false;
    notifyListeners();
  }

  Future<void> addSessionDetails(Timestamp startTime, Timestamp endTime) async {
    if (_isLoading || cafeId == "") {
      return;
    }

    try {
      _isLoading = true;
      notifyListeners();
      final firestore = locator.get<FirestoreService>();
      final booking = await firestore.createBooking(
          cafeId, _selectedCategory, startTime, endTime);
      print(booking);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
