import 'package:get/get.dart';
import '../pages/home/home_screen.dart';
import '../pages/recycle/recycle_screen.dart';
import '../pages/catalog/catalog_screen.dart';
import '../pages/profile/profile_settings_screen.dart';
import '../pages/earning/earning_screen.dart';
import '../pages/scan/scan_screen.dart';
import '../pages/learn_and_earn/learn_and_earn_screen.dart';
import '../pages/community/community_screen.dart';
import '../pages/chat/chat_screen.dart';
import '../models/community_image_model.dart';
import '../models/challenge_model.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  var selectedBottomIndex = 0.obs;
  var isMenuOpen = false.obs;

  // Tab bar index for Learn and Categories
  var selectedTabIndex = 0.obs;

  final List<CommunityImage> communityImages = [
    CommunityImage(
      image: "assets/images/operationkeep.png.jpg",
      title: "Operation keep it clean",
    ),
    CommunityImage(
      image: "assets/images/leadheart.png.jpg",
      title: "Leadheart initiative",
    ),
    CommunityImage(image: "assets/images/3rdpicswaste.jpg", title: "Paper"),
    CommunityImage(image: "assets/images/4thpicswaste.jpg", title: "Metal"),
  ];

  // Challenges data
  final List<Challenge> weeklyChallenges = [
    Challenge(
      title: "Weekly Challenges",
      image: "assets/images/weekly.png",
      status: "Ongoing",
      color: Color(0xFF9E71CD),
    ),
  ];

  final List<Challenge> monthlyChallenges = [
    Challenge(
      title: "Monthly Challenges",
      image: "assets/images/monthly.png",
      status: "New",
      color: Color(0xFFF2CE94),
    ),
  ];

  void onBottomNavTapped(int index) {
    selectedBottomIndex.value = index;
    switch (index) {
      case 0:
        Get.to(() => HomeScreen());
        break;
      case 1:
        Get.to(() => RecycleScreen());
        break;
      case 2:
        Get.to(() => ScanScreen());
        break;
      case 3:
        Get.to(() => CatalogScreen());
        break;
      case 4:
        Get.to(() => ProfileSettingsScreen());
        break;
      default:
        Get.to(() => HomeScreen());
    }
  }

  void navigateMenuItem(String item) {
    toggleMenu();
    switch (item) {
      case "Earn":
        Get.to(() => EarningScreen());
        break;
      case "Learn and earn":
        Get.to(() => LearnAndEarnScreen());
        break;
      case "Recycle Center":
        Get.to(() => RecycleScreen());
        break;
      case "Waste Catalog":
        Get.to(() => CatalogScreen());
        break;
      case "Community":
        Get.to(() => CommunityScreen());
        break;
      case "Chat":
        Get.to(() => ChatScreen());
        break;
      case "Log out":
        Get.offAllNamed('/login');
        break;
      default:
        Get.snackbar("Info", "Feature coming soon");
    }
  }

  void toggleMenu() {
    isMenuOpen.value = !isMenuOpen.value;
  }

  // Routing for Scan button
  void onScanPressed() {
    Get.to(() => ScanScreen());
  }

  // Routing for Earn button
  void onEarnPressed() {
    Get.to(() => EarningScreen());
  }

  // Tab bar selection
  void onTabSelected(int index) {
    selectedTabIndex.value = index;
  }

  // Floating action button action - navigate to Learn and Earn page
  void onFloatingButtonPressed() {
    Get.to(() => LearnAndEarnScreen());
  }
}
