import 'package:flutter/material.dart';

class OnboardingProvider with ChangeNotifier {
  int currentPage = 0;
  final PageController pageController = PageController();

  void setCurrentPage(int index) {
    currentPage = index;
    notifyListeners();
  }

  void goToNextPage() {
    if (currentPage < 2) {
      currentPage++;
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      notifyListeners();
    }
  }
void goToPreviousPage() {
  if (currentPage > 0) {
    currentPage--;
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }
}


  void jumpToPage(int index) {
    currentPage = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  // Optional: dispose the controller when provider is disposed
  void disposeController() {
    pageController.dispose();
  }
}
