import 'package:dungeonconsole/models/modelCafe/model.cafe.dart';
import 'package:dungeonconsole/models/modelConsole/model.console.dart';
import 'package:flutter/material.dart';

class VMPartnerWithUs extends ChangeNotifier {
  Cafe cafeDetails = const Cafe.empty();

  final TextEditingController cafeNameController = TextEditingController();
  final TextEditingController ownerNameController = TextEditingController();
  final TextEditingController ownerPhoneController = TextEditingController();

  // Step Two Controllers
  final TextEditingController pcCountController = TextEditingController();
  final TextEditingController pcAmountController = TextEditingController();
  final TextEditingController psCountController = TextEditingController();
  final TextEditingController psAmountController = TextEditingController();
  final TextEditingController vrCountController = TextEditingController();
  final TextEditingController vrAmountController = TextEditingController();
  final TextEditingController xboxCountController = TextEditingController();
  final TextEditingController xboxAmountController = TextEditingController();
  final TextEditingController streamingCountController =
      TextEditingController();
  final TextEditingController streamingAmountController =
      TextEditingController();
  final TextEditingController simRacingCountController =
      TextEditingController();
  final TextEditingController simRacingAmountController =
      TextEditingController();
  // END - Step Two Controllers

  final TextEditingController topGameController = TextEditingController();
  final TextEditingController googleMapsController = TextEditingController();

  List<String> get cities => [
        'Agra',
        'Ahmedabad',
        'Bengaluru',
        'Bhopal',
        'Chennai',
        'Delhi',
        'Ghaziabad',
        'Hyderabad',
        'Indore',
        'Jaipur',
        'Kanpur',
        'Kolkata',
        'Lucknow',
        'Ludhiana',
        'Mumbai',
        'Nagpur',
        'Patna',
        'Pune',
        'Vadodara',
        'Visakhapatnam'
      ];

  List<String> get states => [
        'Andhra Pradesh',
        'Arunachal Pradesh',
        'Assam',
        'Bihar',
        'Chhattisgarh',
        'Goa',
        'Gujarat',
        'Haryana',
        'Himachal Pradesh',
        'Jharkhand',
        'Karnataka',
        'Kerala',
        'Madhya Pradesh',
        'Maharashtra',
        'Manipur',
        'Meghalaya',
        'Mizoram',
        'Nagaland',
        'Odisha',
        'Punjab',
        'Rajasthan',
        'Sikkim',
        'Tamil Nadu',
        'Telangana',
        'Tripura',
        'Uttar Pradesh',
        'Uttarakhand',
        'West Bengal'
      ];

  List<String> yn = ["Yes", "No"];

  String _openTimeUTC = 'TBD';
  String _closeTimeUTC = 'TBD';
  String _city = '';
  String _state = '';
  final List<Console> _consoles = [];

  bool _isPSConsoleAvailable = false;
  bool _isPCAvailable = false;
  bool _isVRAvailable = false;
  bool _isXboxAvailable = false;
  bool _isStreamingAvailable = false;
  bool _isSimRacingAvailable = false;

  bool get isPSConsoleAvailable => _isPSConsoleAvailable;
  bool get isPCAvailable => _isPCAvailable;
  bool get isVRAvailable => _isVRAvailable;
  bool get isXboxAvailable => _isXboxAvailable;
  bool get isStreamingAvailable => _isStreamingAvailable;
  bool get isSimRacingAvailable => _isSimRacingAvailable;

  bool _isGamingChair = false;
  bool _isWashroom = false;
  bool _isAC = false;
  bool _isParking = false;
  bool _isFoodAllowed = false;
  bool _isAlwaysOpen = false;
  bool _isSmokingAllowed = false;

  bool get isGamingChair => _isGamingChair;
  set isGamingChair(bool value) {
    _isGamingChair = value;
    notifyListeners();
  }

  bool get isWashroom => _isWashroom;
  set isWashroom(bool value) {
    _isWashroom = value;
    notifyListeners();
  }

  bool get isAC => _isAC;
  set isAC(bool value) {
    _isAC = value;
    notifyListeners();
  }

  bool get isParking => _isParking;
  set isParking(bool value) {
    _isParking = value;
    notifyListeners();
  }

  bool get isFoodAllowed => _isFoodAllowed;
  set isFoodAllowed(bool value) {
    _isFoodAllowed = value;
    notifyListeners();
  }

  bool get isAlwaysOpen => _isAlwaysOpen;
  set isAlwaysOpen(bool value) {
    _isAlwaysOpen = value;
    notifyListeners();
  }

  bool get isSmokingAllowed => _isSmokingAllowed;
  set isSmokingAllowed(bool value) {
    _isSmokingAllowed = value;
    notifyListeners();
  }

  int _currentStep = 0;

  int get currentStep => _currentStep;

  void nextStep() {
    if (_currentStep < 2) {
      _currentStep++;
      notifyListeners();
    }
  }

  void previousStep() {
    if (_currentStep > 0) {
      _currentStep--;
      notifyListeners();
    }
  }

  TextEditingController get getCafeNameController => cafeNameController;
  TextEditingController get getOwnerNameController => ownerNameController;
  TextEditingController get getOwnerPhoneController => ownerPhoneController;

  TextEditingController get getPcCountController => pcCountController;
  TextEditingController get getPcAmountController => pcAmountController;
  TextEditingController get getPsCountController => psCountController;
  TextEditingController get getPsAmountController => psAmountController;
  TextEditingController get getVrCountController => vrCountController;
  TextEditingController get getVrAmountController => vrAmountController;
  TextEditingController get getXboxCountController => xboxCountController;
  TextEditingController get getXboxAmountController => xboxAmountController;
  TextEditingController get getStreamingCountController =>
      streamingCountController;
  TextEditingController get getStreamingAmountController =>
      streamingAmountController;
  TextEditingController get getSimRacingCountController =>
      simRacingCountController;
  TextEditingController get getSimRacingAmountController =>
      simRacingAmountController;

  TextEditingController get getTopGamesController => topGameController;
  TextEditingController get getGoogleMapsController => googleMapsController;

  void setControllerValues(
      {String? cafeName, String? ownerName, String? ownerPhoneNumber}) {
    if (cafeName != null) {
      cafeNameController.text = cafeName;
    }
    if (ownerName != null) {
      ownerNameController.text = ownerName;
    }
    if (ownerPhoneNumber != null) {
      ownerPhoneController.text = ownerPhoneNumber;
    }
  }

  void removeConsole(String consoleId, ConsoleType type) {
    switch (type) {
      case ConsoleType.pc:
        _isPCAvailable = true;
        break;
      case ConsoleType.ps:
        _isPSConsoleAvailable = true;
        break;
      case ConsoleType.vr:
        _isVRAvailable = true;
        break;
      case ConsoleType.xbox:
        _isXboxAvailable = true;
        break;
      case ConsoleType.streaming:
        _isStreamingAvailable = true;
        break;
      case ConsoleType.simRacing:
        _isSimRacingAvailable = true;
        break;
    }

    _consoles.removeWhere((console) => console.consoleId == consoleId);
    notifyListeners();
  }

  void addConsole({
    required String consoleId,
    required ConsoleType type,
    required bool allowMultiplayer,
    required double perHourPrice,
    required String tsCreated,
    required String tsUpdated,
  }) {
    switch (type) {
      case ConsoleType.pc:
        _isPCAvailable = true;
        break;
      case ConsoleType.ps:
        _isPSConsoleAvailable = true;
        break;
      case ConsoleType.vr:
        _isVRAvailable = true;
        break;
      case ConsoleType.xbox:
        _isXboxAvailable = true;
        break;
      case ConsoleType.streaming:
        _isStreamingAvailable = true;
        break;
      case ConsoleType.simRacing:
        _isSimRacingAvailable = true;
        break;
    }

    Console console = Console(
      type: type,
      consoleId: consoleId,
      multiplayer: allowMultiplayer,
      count: 1,
      cost: perHourPrice,
      tsCreated: tsCreated,
      tsUpdated: tsUpdated,
    );
    _consoles.add(console);
    notifyListeners();
  }

  List<Console> get consoles => _consoles;

  String get city => _city;
  set city(String value) {
    _city = value;
    notifyListeners();
  }

  String get state => _state;
  set state(String value) {
    _state = value;
    notifyListeners();
  }

  String get openTimeUTC => _openTimeUTC;
  set openTimeUTC(String value) {
    _openTimeUTC = value;
    notifyListeners();
  }

  String get closeTimeUTC => _closeTimeUTC;
  set closeTimeUTC(String value) {
    _closeTimeUTC = value;
    notifyListeners();
  }

  void submit() {
    if (_city.isEmpty || _state.isEmpty || _consoles.isEmpty) {
      // Handle validation error
      return;
    }

    // ignore: unused_local_variable
    cafeDetails = cafeDetails.copyWith(
      id: 'TBD',
      ownerName: ownerNameController.text,
      ownerPhone: ownerPhoneController.text,
      cafeName: cafeNameController.text,
      city: _city,
      state: _state,
      consoleType: _consoles,
      tsCreated: DateTime.now().toUtc().toString(),
      tsUpdated: DateTime.now().toUtc().toString(),
    );
  }

  void submitInventoryInfo() {
    for (var i = 0; i < _consoles.length; i++) {
      switch (_consoles[i].type) {
        case ConsoleType.pc:
          _consoles[i] = _consoles[i].copyWith(
            count: int.tryParse(pcCountController.text) ?? 0,
            cost: double.tryParse(pcAmountController.text) ?? 0.0,
          );
          break;
        case ConsoleType.ps:
          _consoles[i] = _consoles[i].copyWith(
            count: int.tryParse(psCountController.text) ?? 0,
            cost: double.tryParse(psAmountController.text) ?? 0.0,
          );
          break;
        case ConsoleType.vr:
          _consoles[i] = _consoles[i].copyWith(
            count: int.tryParse(vrCountController.text) ?? 0,
            cost: double.tryParse(vrAmountController.text) ?? 0.0,
          );
          break;
        case ConsoleType.xbox:
          _consoles[i] = _consoles[i].copyWith(
            count: int.tryParse(xboxCountController.text) ?? 0,
            cost: double.tryParse(xboxAmountController.text) ?? 0.0,
          );
          break;
        case ConsoleType.streaming:
          _consoles[i] = _consoles[i].copyWith(
            count: int.tryParse(streamingCountController.text) ?? 0,
            cost: double.tryParse(streamingAmountController.text) ?? 0.0,
          );
          break;
        case ConsoleType.simRacing:
          _consoles[i] = _consoles[i].copyWith(
            count: int.tryParse(simRacingCountController.text) ?? 0,
            cost: double.tryParse(simRacingAmountController.text) ?? 0.0,
          );
          break;
      }
    }
    notifyListeners();
  }

  void submitFinal() {
    cafeDetails = cafeDetails.copyWith(
      id: 'TBD',
      ownerName: ownerNameController.text,
      ownerPhone: ownerPhoneController.text,
      cafeName: cafeNameController.text,
      city: _city,
      state: _state,
      consoleType: _consoles,
      tsCreated: DateTime.now().toUtc().toString(),
      tsUpdated: DateTime.now().toUtc().toString(),
      openTimeUTC: _openTimeUTC,
      closeTimeUTC: _closeTimeUTC,
      isGamingChair: _isGamingChair,
      isWashroom: _isWashroom,
      isAC: _isAC,
      isParking: _isParking,
      isFoodAllowed: _isFoodAllowed,
      isAlwaysOpen: _isAlwaysOpen,
      isSmokingAllowed: _isSmokingAllowed,
      topGames: topGameController.text,
      googleMapsLink: googleMapsController.text,
    );
    notifyListeners();
  }

  @override
  void dispose() {
    cafeNameController.dispose();
    ownerNameController.dispose();
    ownerPhoneController.dispose();
    pcCountController.dispose();
    pcAmountController.dispose();
    psCountController.dispose();
    psAmountController.dispose();
    vrCountController.dispose();
    vrAmountController.dispose();
    xboxCountController.dispose();
    xboxAmountController.dispose();
    streamingCountController.dispose();
    streamingAmountController.dispose();
    simRacingCountController.dispose();
    simRacingAmountController.dispose();
    topGameController.dispose();
    googleMapsController.dispose();
    super.dispose();
  }
}
