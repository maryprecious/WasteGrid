import 'dart:async';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:gap/gap.dart';
import '../../utils/app_colors.dart';
import '../auth/login.dart';
import '../onboarding/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final List<String> svgAssets = [
    'assets/svgs/svg1.svg',
    'assets/svgs/svg2.svg',
    'assets/svgs/svg3.svg',
    'assets/svgs/svg4.svg',
  ];

  int _currentSvgIndex = -1;
  bool _showLogo = false;

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAnimationSequence();
    _initHiveAndCheckFirstTimeUser();
  }

  void _startAnimationSequence() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentSvgIndex++;
        if (_currentSvgIndex >= svgAssets.length) {
          _showLogo = true;
          _timer.cancel();
        }
      });
    });
  }

    Future<void> _initHiveAndCheckFirstTimeUser() async {
      await Hive.initFlutter();
      var box = await Hive.openBox('userBox');
      bool isFirstTime = box.get('isFirstTime', defaultValue: true);

      if (isFirstTime) {
        await box.put('isFirstTime', false);
        Future.delayed(Duration(seconds: svgAssets.length * 2 -1), () {
          Get.offAll(() =>  OnboardingScreen());
        });
      } else {
        Future.delayed(Duration(seconds: svgAssets.length * 2 - 1), () {
          Get.offAll(() =>  LoginScreen());
        });
      }
    }

  @override
  void dispose() {
    _timer.cancel();
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_showLogo)
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 350.w,
                  height: 350.h,
                  color: AppColors.primary,
                ),
              ),
              Gap(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[

            ...List.generate(svgAssets.length, (index) {
              if (index <= _currentSvgIndex) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0,
                  horizontal: 16.0
                  ),
                  child: SvgPicture.asset(
                    svgAssets[index],
                    width: 30,
                    height: 30,
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            }),
                ]
              ),
            Gap(10),
            if (_showLogo)
              Text(
                'Powering a Cleaner Tomorrow',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.mainColor,
                )
              ),
          ],
        ),
      ),
    );
  }
}
