import 'package:dungeonconsole/main.dart';
import 'package:dungeonconsole/models/modelBooking/model.booking.dart';
import 'package:dungeonconsole/services/service.firestore.dart';
import 'package:flutter/material.dart';

class VMUpcomingBooking extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _showNoResults = false;
  bool get showNoResults => _showNoResults;

  List<Booking> _upcomingBookings = [];
  List<Booking> get upcomingBookings => _upcomingBookings;

  VMUpcomingBooking(String cafeId) {
    fetchUpcomingBookings(cafeId);
  }

  Future<void> fetchUpcomingBookings(String cafeId) async {
    if (_isLoading) {
      return;
    }

    try {
      _isLoading = true;
      notifyListeners();
      // Fetch upcoming bookings from Firestore
      final firestoreService = locator.get<FirestoreService>();
      String date = DateTime.now().toUtc().toIso8601String().split('T')[0];
  
      final upcomingBookings =
          await firestoreService.getBookingsByDate(cafeId, date);
      _upcomingBookings = upcomingBookings;

      if(_upcomingBookings.isEmpty){
        _showNoResults = true;
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      print('Error: $e');
      _isLoading = false;
      notifyListeners();
    }
  }
}