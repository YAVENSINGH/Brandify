import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Title
            Text(
              "Let's get started",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 8),

            /// Subtitle
            Text(
              '"Sign Up Now and Access Exclusive Features for Limitless Inspiration!"',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),

            SizedBox(height: 20),

            /// Name Input
            _buildTextField("Name", Icons.person),

            /// Email Input
            _buildTextField("Email", Icons.email),

            /// Password Input
            _buildTextField("Password", Icons.lock, isPassword: true),

            /// Confirm Password Input
            _buildTextField("Confirm Password", Icons.lock, isPassword: true),

            SizedBox(height: 10),

            /// Terms & Policy
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(value: true, onChanged: (value) {}),
                Text("I agree to the ", style: TextStyle(color: Colors.white)),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Terms of Service",
                    style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(" and ", style: TextStyle(color: Colors.white)),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Privacy Policy",
                    style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

            /// Create Account Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {},
              child: Text("Create your account", style: TextStyle(color: Colors.white)),
            ),

            SizedBox(height: 10),

            /// Continue with Google Button
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {},
              icon: Icon(Icons.g_translate, color: Colors.white),
              label: Text("Continue with Google", style: TextStyle(color: Colors.white)),
            ),

            SizedBox(height: 10),

            /// Already have an account? Sign In
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Text.rich(
                TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(color: Colors.white),
                  children: [
                    TextSpan(
                      text: "Sign In",
                      style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Reusable TextField Widget
  Widget _buildTextField(String hint, IconData icon, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade900,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(icon, color: Colors.white),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
