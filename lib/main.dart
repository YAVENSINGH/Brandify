import 'package:brandify/views/screens/required_fields/content_creation_screen.dart';
import 'package:brandify/views/screens/required_fields/details_screen.dart';
import 'package:brandify/views/screens/reset_password_screen.dart';
import 'package:brandify/views/screens/verify_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/viewmodel/forgot_password_viewmodel.dart';
import 'views/screens/forgot_password_screen.dart';
import 'views/screens/login_screen.dart';
import 'views/screens/signup_screen.dart';
import 'views/screens/splash_screen.dart';
import 'views/screens/onboarding_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ForgotPasswordViewModel>(
          create: (_) => ForgotPasswordViewModel(),
        ),
        // Add other providers here
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/onboarding': (context) => OnboardingScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/forgotPassword': (context) => ForgotPasswordScreen(),
        '/verifyOtp': (context) => VerifyOtpScreenUI(),
        '/resetPassword': (context) => ResetPasswordScreen(),
        '/BrandDetails': (context) => BrandDetailsScreen(),
        '/nextDetails': (context) => ContentCreationScreen(),  // Fixed route
      },

    );
  }
}
