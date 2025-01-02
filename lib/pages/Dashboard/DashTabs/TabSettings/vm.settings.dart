import 'package:dungeonconsole/main.dart';
import 'package:dungeonconsole/models/modelCafe/model.cafe.dart';
import 'package:dungeonconsole/services/service.firestore.dart';
import 'package:flutter/foundation.dart';

class VMSettings extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _showErrorSnackbar = false;
  bool get showErrorSnackbar => _showErrorSnackbar;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  Cafe? cafeDetails;
  VMSettings(Cafe? cafe){
    cafeDetails = cafe;
    notifyListeners();
  }

  String get id => cafeDetails?.id ?? '';
  String get ownerName => cafeDetails?.ownerName ?? '';
  String get ownerPhone => cafeDetails?.ownerPhone ?? '';
  String get cafeName => cafeDetails?.cafeName ?? '';
  String get city => cafeDetails?.city ?? '';

  bool get isGamingChair => cafeDetails?.isGamingChair ?? false;
  bool get isWashroom => cafeDetails?.isWashroom ?? false;
  bool get isAC => cafeDetails?.isAC ?? false;
  bool get isParking => cafeDetails?.isParking ?? false;
  bool get isFoodAllowed => cafeDetails?.isFoodAllowed ?? false;
  bool get isAlwaysOpen => cafeDetails?.isAlwaysOpen ?? false;
  bool get isSmokingAllowed => cafeDetails?.isSmokingAllowed ?? false;
  String get openTimeUTC => cafeDetails?.openTimeUTC ?? '';
  String get closeTimeUTC => cafeDetails?.closeTimeUTC ?? '';
  String get topGames => cafeDetails?.topGames ?? '';
  String get googleMapsLink => cafeDetails?.googleMapsLink ?? '';
  int get registerStep => cafeDetails?.registerStep ?? 0;
  bool get isVerified => cafeDetails?.isVerified ?? false;
  String get tsCreated => cafeDetails?.tsCreated ?? '';
  String get tsUpdated => cafeDetails?.tsUpdated ?? '';


  bool _updateGamingChair = false;
  bool _updateWashroom = false;
  bool _updateAC = false;
  bool _updateParking = false;
  bool _updateFoodAllowed = false;
  bool _updateAlwaysOpen = false;
  bool _updateSmokingAllowed = false;
  
  bool get updateGamingChair => _updateGamingChair;
  set updateGamingChair(bool value) {
    _updateGamingChair = value;
    notifyListeners();
  }

  bool get updateWashroom => _updateWashroom;
  set updateWashroom(bool value) {
    _updateWashroom = value;
    notifyListeners();
  }

  bool get updateAC => _updateAC;
  set updateAC(bool value) {
    _updateAC = value;
    notifyListeners();
  }

  bool get updateParking => _updateParking;
  set updateParking(bool value) {
    _updateParking = value;
    notifyListeners();
  }

  bool get updateFoodAllowed => _updateFoodAllowed;
  set updateFoodAllowed(bool value) {
    _updateFoodAllowed = value;
    notifyListeners();
  }

  bool get updateAlwaysOpen => _updateAlwaysOpen;
  set updateAlwaysOpen(bool value) {
    _updateAlwaysOpen = value;
    notifyListeners();
  }

  bool get updateSmokingAllowed => _updateSmokingAllowed;
  set updateSmokingAllowed(bool value) {
    _updateSmokingAllowed = value;
    notifyListeners();
  }

  
  void updateCafeListValues() async {
    if(_isLoading){
      return;
    }

    try {
      _isLoading = true;
      notifyListeners();

      Cafe updatedCafeDetails = cafeDetails!.copyWith(
        isGamingChair: _updateGamingChair,
        isWashroom: _updateWashroom,
        isAC: _updateAC,
        isParking: _updateParking,
        isFoodAllowed: _updateFoodAllowed,
        isAlwaysOpen: _updateAlwaysOpen,
        isSmokingAllowed: _updateSmokingAllowed,
      );

      await locator
          .get<FirestoreService>()
          .updateCafeRecord(updatedCafeDetails);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = "Something went wrong.";
      _isLoading = false;
      _showErrorSnackbar = true;
      notifyListeners();
    }
  }
}