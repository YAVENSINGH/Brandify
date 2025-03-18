import 'package:flutter/material.dart';
import '../../models/onboarding_model.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingModel page;

  const OnboardingPage({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Image Section
            Expanded(
              flex: 4,
              child: Image.asset(page.imagePath, fit: BoxFit.contain),
            ),

            /// Spacing
            SizedBox(height: 30),

            /// Title Section
            Text(
              page.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            /// Spacing
            SizedBox(height: 10),

            /// Description Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                page.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[400],
                ),
              ),
            ),

            /// Spacing
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
