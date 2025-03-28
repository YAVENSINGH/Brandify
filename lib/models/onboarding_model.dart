class OnboardingModel {
  final String title;
  final String description;
  final String imagePath;
  final bool isLastPage;

  OnboardingModel({
    required this.title,
    required this.description,
    required this.imagePath,
    this.isLastPage = false,
  });
}
