import 'package:dungeonconsole/main.dart';
import 'package:dungeonconsole/models/modelBooking/model.booking.dart';
import 'package:dungeonconsole/services/service.firestore.dart';
import 'package:flutter/foundation.dart';

class VMViewAllBooking extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _showNoResults = false;
  bool get showNoResults => _showNoResults;

  List<Booking> _upcomingBookings = [];
  List<Booking> get upcomingBookings => _upcomingBookings;

  String _date = DateTime.now().toIso8601String().split('T')[0];
  String get date => _date;

  void selectedDate(DateTime date, cafeId) {
    _date = date.toIso8601String().split('T')[0];
    fetchUpcomingBookings(cafeId);
    notifyListeners();
  }

  VMViewAllBooking(String cafeId) {
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
      
  
      _upcomingBookings =
          await firestoreService.getBookingsByDate(cafeId, _date);

      if(_upcomingBookings.isEmpty){
        _showNoResults = true;
      } else {
         _showNoResults = false;
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }
}