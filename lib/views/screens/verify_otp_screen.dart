import 'package:flutter/material.dart';

class VerifyOtpScreenUI extends StatelessWidget {
  const VerifyOtpScreenUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF6E1B9D), // Purple shade at the top
              Colors.black,      // Black at the bottom
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  /// Title
                  Text(
                    "Verify yourself",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),

                  /// Subtitle
                  Text(
                    '"Verify your identity and secure your account: Check your email for the OTP to continue."',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade200,
                    ),
                  ),
                  SizedBox(height: 40),

                  /// OTP Boxes
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildOtpBox(),
                      _buildOtpBox(),
                      _buildOtpBox(),
                      _buildOtpBox(),
                    ],
                  ),
                  SizedBox(height: 40),

                  /// Verify Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF5A8A),
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/resetPassword');
                    },
                    child: Text(
                      "Verify",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// A single OTP box for a single digit
  Widget _buildOtpBox() {
    return Container(
      width: 50,
      child: TextField(
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 18),
        maxLength: 1,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          counterText: "", // hides the character counter
          hintText: "-",
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.black.withOpacity(0.3),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) {
          // TODO: Optionally handle digit input
        },
      ),
    );
  }
}
