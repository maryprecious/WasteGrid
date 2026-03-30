import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'controller/onboarding_controller.dart';
import '../../widget/custom_app_button.dart';
import 'package:gap/gap.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final OnboardingController controller = Get.put(OnboardingController());

  final List<Map<String, String>> onboardingData = [
    {
      "image":  'assets/images/onboarding_1.jpg',
      "title": "Sort Smart with Ease",
      "description": "Scan, learn, and dispose the right way—Wastegrid makes waste sorting simple, fun, and rewarding.",
    },
    {
      "image": 'assets/images/onboarding_2.jpg',
      "title": "Scan Waste to Sort",
      "description": "Snap a photo or scan a barcode to instantly know if it's recyclable, non-recyclable compostable, or trash."
    },
    {
      "image":  'assets/images/onboarding_3.jpg',
      "title": "Learn and Earn Points",
      "description": "Learn about Waste management, stack up points, and swap them for airtime, data and and more! The more you learn, the more you earn."
    },
    {
      "image":  'assets/images/onboarding_4.jpg',
      "title": "Complete Challenges",
      "description": "Level up your green game—complete daily Waste-tasks, earn points, and climb the leaderboard while making real impact."
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Skip button aligned to top right
            Padding(
              padding: EdgeInsets.only(right: 24.w, top: 16.h),
              child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Get.offAllNamed('/login');
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  controller.setCurrentIndex(index);
                },
                itemBuilder: (context, index) {
                  final item = onboardingData[index];
                  return  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.asset(
                            item["image"]!,
                            fit: BoxFit.cover,
                            width: 400.w //MediaQuery.of(context).size.width
                          ),
                        ),
              Gap(15),
                       Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onboardingData.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      width: controller.currentIndex.value == index ? 24 : 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: controller.currentIndex.value == index
                            ? AppColors.mainColor
                            : AppColors.mainColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                )),

                        const SizedBox(height: 24),
                        Text(
                          item["title"]!,
                           style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                height: 32 / 22,
                                letterSpacing: 0.67,
                                color: AppColors.textSecondary,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding:  EdgeInsets.symmetric(horizontal:24),
                          child: Text(
                          item["description"]!,
                          style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                height: 22 / 12,
                                letterSpacing: 0.67 * 4.79 / 3.05,
                                color: AppColors.textSecondary,
                              ),
                              textAlign: TextAlign.left,
                            )),
                      ],
                    );
                },
              ),
            ),
           

            const SizedBox(height: 24),
       
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Obx(() => CustomAppButton(
                    text: controller.currentIndex.value == onboardingData.length - 1
                        ? 'Get Started'
                        : 'Next',
                    onPressed: () => controller.onNextPressed(onboardingData.length),
                    color: AppColors.mainColor,
                    textColor: Colors.white,
                  )),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
