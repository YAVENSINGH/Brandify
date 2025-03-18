import 'package:flutter/material.dart';
import '../../models/onboarding_model.dart';

class OnboardingViewModel extends ChangeNotifier {
  int currentIndex = 0;
  PageController pageController = PageController();

  final List<OnboardingModel> onboardingPages = [
    OnboardingModel(
      title: "Welcome to Brandify",
      description: "Unlock brand recognition like AI, Ignite Your Imagination!",
      imagePath: "assets/images/onboarding1.png",
      isLastPage: false,
    ),
    OnboardingModel(
      title: "Effortless Content Creation",
      description: "Save a few clicks by letting AI assist your workflows!",
      imagePath: "assets/images/onboarding2.png",
      isLastPage: false,
    ),
    OnboardingModel(
      title: "Creativity at Your Fingertips",
      description: "Explore custom brand styles, captions, and templates.",
      imagePath: "assets/images/onboarding3.png",
      isLastPage: false,
    ),
    OnboardingModel(
      title: "Start Your Content Journey",
      description: "Sign in to unleash the potential of AI-powered content creation.",
      imagePath: "assets/images/onboarding4.png",
      isLastPage: true,
    ),
  ];

  /// Moves to the next page or navigates to login if last page.
  void nextPage(BuildContext context) {
    if (currentIndex < onboardingPages.length - 1) {
      currentIndex++;
      pageController.animateToPage(
        currentIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      goToLoginScreen(context);
    }
    notifyListeners(); // Ensure UI updates
  }

  /// Moves back to the previous page.
  void previousPage() {
    if (currentIndex > 0) {
      currentIndex--;
      pageController.animateToPage(
        currentIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      notifyListeners();
    }
  }

  /// Skips directly to the last page.
  void skipToLastPage() {
    currentIndex = onboardingPages.length - 1;
    pageController.jumpToPage(currentIndex);
    notifyListeners();
  }

  /// Updates the current index when PageView changes.
  void updateIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  /// Navigates to the login screen.
  void goToLoginScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login');
  }
}