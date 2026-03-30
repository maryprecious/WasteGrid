import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../auth/login.dart';

class OnboardingController extends GetxController {
  var currentIndex = 0.obs;
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  void setCurrentIndex(int index) {
    currentIndex.value = index;
  }

  void onNextPressed(int totalSlides) {
    if (currentIndex.value < totalSlides - 1) {
      currentIndex.value++;
      pageController.animateToPage(
        currentIndex.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // TODO: Navigate to next screen, e.g., login or home
      print('Onboarding completed');
      Get.offAll(()=> LoginScreen());
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
