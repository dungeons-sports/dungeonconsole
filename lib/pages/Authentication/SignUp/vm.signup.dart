import 'package:dungeonconsole/main.dart';
import 'package:dungeonconsole/models/modelUser/model.user.dart';
import 'package:dungeonconsole/services/service.authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VMSignup extends ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isEmailValid = true;
  bool _isPasswordValid = true;
  bool _onLoginError = false;

  String _emailErrorMessage = "";
  String _passwordErrorMessage = "";
  String _loginErrorMessage = "";

  bool get isEmailValid => _isEmailValid;
  bool get isPasswordValid => _isPasswordValid;
  bool get onLoginError => _onLoginError;
  String get emailErrorMessage => _emailErrorMessage;
  String get passwordErrorMessage => _passwordErrorMessage;
  String get loginErrorMessage => _loginErrorMessage;

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  void clearLoginErrorMessage() {
    _emailController.text = "";
    _passwordController.text = "";
    _emailErrorMessage = "";
    _passwordErrorMessage = "";
    _isEmailValid = true;
    _isPasswordValid = true;
    _loginErrorMessage = "";
    _onLoginError = false;
    notifyListeners();
  }

  bool validate(String email, String password) {
    if (email.isEmpty) {
      _emailErrorMessage = "Cannot be empty";
      _isEmailValid = false;
      notifyListeners();
      return false;
    } else {
      _isEmailValid = true;
      notifyListeners();
    }

    // Validate email format using regex
    final RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(email)) {
      _emailErrorMessage = "Invalid email format";
      _isEmailValid = false;
      notifyListeners();
      return false;
    } else {
      _isEmailValid = true;
      notifyListeners();
    }

    if (password.isEmpty) {
      _passwordErrorMessage = "Cannot be empty";
      _isPasswordValid = false;
      notifyListeners();
      return false;
    } else {
      _isPasswordValid = true;
      notifyListeners();
    }

    return true;
  }

  Future<AppUser?> createAccountWithEmail(bool isPartner) async {
    if (_isLoading) {
      return null;
    }

    try {
      _isLoading = true;
      notifyListeners();

      final String email = _emailController.text;
      final String password = _passwordController.text;

      bool isValid = validate(email, password);

      if (isValid) {
        final authService = locator.get<AuthenticationService>();
        AppUser? appuser = await authService.signUpWithEmailPassword(
            email, password, isPartner);

        _isLoading = false;
        notifyListeners();

        return appuser!;
      }
      _isLoading = false;
      notifyListeners();
      return null;
    } on FirebaseAuthException catch (e) {
       _onLoginError = true;
      _loginErrorMessage = e.message!;
      _isLoading = false;
      notifyListeners();
      return null;
    }
  }

  Future<AppUser?> signUpWithGoogle(bool isPartner) async {
    if (_isLoading) {
      return null;
    }

    try {
      _isLoading = true;
      notifyListeners();

      final authService = locator.get<AuthenticationService>();
      AppUser? appUser = await authService.signUpWithGoogle(isPartner);

      _isLoading = false;
      notifyListeners();

      return appUser;
    } on FirebaseAuthException catch (e) {
      _onLoginError = true;
      _loginErrorMessage = e.message!;
      _isLoading = false;
      notifyListeners();
      return null;
    }
  }
}
