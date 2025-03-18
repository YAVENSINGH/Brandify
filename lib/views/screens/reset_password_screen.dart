import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/viewmodel/forgot_password_viewmodel.dart';

class ResetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ForgotPasswordViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Reset Password",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: (value) => viewModel.updateNewPassword(value),
              obscureText: true,
              decoration: InputDecoration(
                hintText: "New Password",
                filled: true,
                fillColor: Colors.grey.shade900,
                prefixIcon: Icon(Icons.lock, color: Colors.white),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => viewModel.resetPassword(context),
              child: viewModel.isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
