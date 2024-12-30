import 'package:dungeonconsole/main.dart';
import 'package:dungeonconsole/models/modelUser/model.user.dart';
import 'package:dungeonconsole/services/service.authentication.dart';
import 'package:flutter/material.dart';

class VMSignup extends ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _emailErrorMessage = "";
  String _passwordErrorMessage = "";

  String get emailErrorMessage => _emailErrorMessage;
  String get passwordErrorMessage => _passwordErrorMessage;

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  bool _emailError = false;
  bool _passwordError = false;

  bool get emailError => _emailError;
  bool get passwordError => _passwordError;

  Future<AppUser?> createAccountWithEmail(bool isPartner) async {
    if (_isLoading) {
      return null;
    }

    try {
      _isLoading = true;
      notifyListeners();

      final String email = _emailController.text;
      final String password = _passwordController.text;

      _emailError = email.isEmpty;
      _passwordError = password.isEmpty;

      if (_emailError) {
        _emailErrorMessage = "Cannot be empty";
        notifyListeners();
        return null;
      }

      if (_passwordError) {
        _passwordErrorMessage = "Cannot be empty";
        notifyListeners();
        return null;
      }

      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
      if (!emailRegex.hasMatch(email)) {
        _emailError = true;
        _emailErrorMessage = "Invalid email format";
        notifyListeners();
        return null;
      }

      final authService = locator.get<AuthenticationService>();
      AppUser? appuser =
          await authService.signUpWithEmailPassword(email, password, isPartner);

      _isLoading = false;
      notifyListeners();

      return appuser!;
    } catch (e) {
      print(e);
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
    } catch (e) {
      print(e);
      _isLoading = false;
      notifyListeners();

      return null;
    }
  }
}
