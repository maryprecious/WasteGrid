import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var currentIndex = 0.obs;

  void setCurrentIndex(int index) {
    currentIndex.value = index;
  }
}
