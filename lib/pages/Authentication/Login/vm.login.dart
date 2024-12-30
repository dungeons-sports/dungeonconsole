import 'package:dungeonconsole/main.dart';
import 'package:dungeonconsole/models/modelUser/model.user.dart';
import 'package:dungeonconsole/services/service.authentication.dart';
import 'package:flutter/material.dart';

class VMLogin extends ChangeNotifier {
  bool _isLoading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  bool get isLoading => _isLoading;

  Future<void> loginWithEmail() async {
    final AuthenticationService authService =
        locator.get<AuthenticationService>();
    final String email = _emailController.text;
    final String password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      print('Email and password must not be empty');
      return;
    }

    try {
      await authService.loginWithEmailPassword(email, password);
    } catch (e) {
      // Handle login error
      print('Login failed: $e');
    }
  }

  Future<bool> signUpWithGoogle(bool isPartner) async {
    if (_isLoading) {
      return false;
    }

    try {
      _isLoading = true;
      notifyListeners();

      final authService = locator.get<AuthenticationService>();
      AppUser? appUser = await authService.signUpWithGoogle(isPartner);

      if(appUser != null){
        if(appUser.cafeId != null){
          return true;
        }
      }

      _isLoading = false;
      notifyListeners();

      return false;
    } catch (e) {
      print(e);
      _isLoading = false;
      notifyListeners();

      return false;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
