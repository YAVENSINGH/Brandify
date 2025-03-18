import 'package:flutter/material.dart';

import '../../models/forget_password_model.dart';

class ForgotPasswordViewModel extends ChangeNotifier {
  ForgotPasswordModel _forgotPassword = ForgotPasswordModel();
  bool _isLoading = false;

  ForgotPasswordModel get forgotPassword => _forgotPassword;
  bool get isLoading => _isLoading;

  void updateEmail(String email) {
    _forgotPassword.email = email;
    notifyListeners();
  }

  void updateOTP(String otp) {
    _forgotPassword.otp = otp;
    notifyListeners();
  }

  void updateNewPassword(String password) {
    _forgotPassword.newPassword = password;
    notifyListeners();
  }

  Future<void> sendResetLink(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 2)); // Simulate API Call

    _isLoading = false;
    notifyListeners();

    Navigator.pushNamed(context, '/verifyOtp');
  }

  Future<void> verifyOtp(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 2)); // Simulate Verification

    _isLoading = false;
    notifyListeners();

    Navigator.pushNamed(context, '/resetPassword');
  }

  Future<void> resetPassword(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 2)); // Simulate API Call

    _isLoading = false;
    notifyListeners();

    Navigator.pushNamed(context, '/login');
  }
}
