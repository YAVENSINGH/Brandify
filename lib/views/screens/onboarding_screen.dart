import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/viewmodel/onboarding_viewmodel.dart';
import '../widgets/onboarding_page.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OnboardingViewModel(),
      child: Consumer<OnboardingViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: viewModel.pageController,
                    onPageChanged: (index) {
                      viewModel.updateIndex(index);
                    },
                    itemCount: viewModel.onboardingPages.length,
                    itemBuilder: (context, index) {
                      return OnboardingPage(page: viewModel.onboardingPages[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Show "Back" button only if not on first page
                      if (viewModel.currentIndex > 0)
                        TextButton(
                          onPressed: viewModel.previousPage,
                          child: Text("Back", style: TextStyle(color: Colors.white)),
                        ),

                      // Show "Skip" button only on the first page
                      if (viewModel.currentIndex == 0)
                        TextButton(
                          onPressed: viewModel.skipToLastPage,
                          child: Text("Skip", style: TextStyle(color: Colors.grey)),
                        ),

                      // Show "Next" button if not on last page
                      if (!viewModel.onboardingPages[viewModel.currentIndex].isLastPage)
                        FloatingActionButton(
                          onPressed: () => viewModel.nextPage(context),
                          child: Icon(Icons.arrow_forward, color: Colors.white),
                          backgroundColor: Colors.purple,
                        ),

                      // Show "Get Started" button only on last page
                      if (viewModel.onboardingPages[viewModel.currentIndex].isLastPage)
                        ElevatedButton(
                          onPressed: () => viewModel.goToLoginScreen(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                          child: Text("Get Started", style: TextStyle(color: Colors.white, fontSize: 16)),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
