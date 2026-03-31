import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:waste_grid/controller/home_controller.dart';
// import 'package:waste_grid/pages/community/community_screen.dart';
// import 'package:waste_grid/utils/app_colors.dart';
// import 'package:waste_grid/pages/profile/profile_settings_screen.dart';
// import 'package:waste_grid/pages/earning/earning_screen.dart';
// import 'package:waste_grid/pages/learn_and_earn/learn_and_earn_screen.dart';
// import 'package:waste_grid/pages/recycle/recycle_screen.dart';
// import 'package:waste_grid/pages/auth/login.dart';
// import 'package:waste_grid/pages/profile/notification_screen.dart';

// class HomeScreen extends StatelessWidget {
//   final HomeController controller = Get.put(HomeController());

//   HomeScreen({super.key});

//   Widget _menuItem(String title, dynamic onTap) {
//     return ListTile(
//       title: Text(
//         title,
//         style: TextStyle(
//           fontSize: 16.sp,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//       onTap: onTap,
//       contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
//       horizontalTitleGap: 0,
//     );
//   }

//   Widget _challengeCard({
//     required String title,
//     required String image,
//     required String status,
//     required Color color,
//   }) {
//     return Container(
//       width: 200.w,
//       margin: EdgeInsets.only(right: 15.w),
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(20.r),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 8.r,
//             offset: Offset(0, 4.h),
//           ),
//         ],
//       ),
//       child: Stack(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(20.r),
//             child: Image.asset(
//               image,
//               width: 200.w,
//               height: 150.h,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Positioned(
//             top: 10.h,
//             right: 10.w,
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
//               decoration: BoxDecoration(
//                 color: status == "Ongoing" ? Colors.white : Colors.white,
//                 borderRadius: BorderRadius.circular(12.r),
//               ),
//               child: Text(
//                 status,
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 11.sp,
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 10.h,
//             left: 10.w,
//             child: Container(
//               alignment: Alignment.centerLeft,
//               padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(32.r),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 9.sp,
//                     ),
//                   ),
//                   Text(
//                     "learn more",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 7.sp,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _communityCard({
//     required String title,
//     required String image,
//   }) {
//     return GestureDetector(
//       onTap: () {
//         Get.to(() => CommunityScreen());
//       },
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: 10.w),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               height: 160.h,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20.r),
//                 image: DecorationImage(
//                   image: AssetImage(image),
//                   fit: BoxFit.cover,
//                   colorFilter: ColorFilter.mode(
//                     Colors.black.withOpacity(0.25),
//                     BlendMode.darken,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 8.h),
//             Text(
//               title,
//               style: TextStyle(
//                 color: Colors.black87,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 14.sp,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     ScreenUtil.init(context, designSize: Size(360, 690), minTextAdapt: true);

//     return Scaffold(
//       backgroundColor: AppColors.backgroundColor,
//       body: SafeArea(
//         child: Obx(() {
//           return Stack(
//             children: [
//               SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Header with gradient, user info, menu and notification icons
//                     Container(
//                       width: double.infinity,
//                       padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [AppColors.greenStart, AppColors.greenEnd],
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                         ),
//                         borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.circular(30.r),
//                           bottomRight: Radius.circular(30.r),
//                         ),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(height: 15.h),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               GestureDetector(
//                                 onTap: () {
//                                   Get.to(() => ProfileSettingsScreen());
//                                 },
//                                 child: Row(
//                                   children: [
//                                     CircleAvatar(
//                                       radius: 25.r,
//                                       backgroundImage: AssetImage('assets/images/profilepics.jpg'),
//                                     ),
//                                     SizedBox(width: 12.w),
//                                     Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           "Hi, David Smith",
//                                           style: TextStyle(
//                                             color: Colors.white,
//                                             fontSize: 14.sp,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                         SizedBox(height: 4.h),
//                                         Text(
//                                           "Los Angeles, USA",
//                                           style: TextStyle(
//                                             color: Colors.white70,
//                                             fontSize: 12.sp,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Row(
//                                 children: [
//                                   GestureDetector(
//                                     onTap: () {
//                                       controller.toggleMenu();
//                                     },
//                                     child: SvgPicture.asset(
//                                       'assets/svgs/menu.svg',
//                                       width: 24.w,
//                                       height: 24.h,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   SizedBox(width: 20.w),
//                                   GestureDetector(
//                                     onTap: () {
//                                       // Navigate to notification screen inside profile
//                                       Get.to(() => NotificationScreen());
//                                     },
//                                     child: Icon(Icons.notifications, color: Colors.white),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 20.h),
//                           // Scan and Earn buttons
//                           Container(
//                             height: 100.h,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(20.r),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black12,
//                                   blurRadius: 10.r,
//                                   offset: Offset(0, 5.h),
//                                 ),
//                               ],
//                             ),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   child: TextButton.icon(
//                                     onPressed: () {
//                                       controller.onScanPressed();
//                                     },
//                                     icon: SvgPicture.asset(
//                                       'assets/svgs/scan.svg',
//                                       width: 45.w,
//                                       height: 45.h,
//                                       color: AppColors.greenStart,
//                                     ),
//                                     label: Text(
//                                       "Scan",
//                                       style: TextStyle(
//                                         color: AppColors.greenStart,
//                                         fontSize: 16.sp,
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                     ),
//                                     style: TextButton.styleFrom(
//                                       padding: EdgeInsets.symmetric(vertical: 15.h),
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.only(
//                                           topLeft: Radius.circular(20.r),
//                                           bottomLeft: Radius.circular(20.r),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   width: 1.w,
//                                   height: 100.h,
//                                   color: AppColors.greenStart.withOpacity(0.3),
//                                 ),
//                                 Expanded(
//                                   child: TextButton.icon(
//                                     onPressed: () {
//                                       Get.to(() => EarningScreen());
//                                     },
//                                     icon: SvgPicture.asset(
//                                       'assets/svgs/earn.svg',
//                                       width: 50.w,
//                                       height: 50.h,
//                                       color: AppColors.greenStart,
//                                     ),
//                                     label: Text(
//                                       "Earn",
//                                       style: TextStyle(
//                                         color: AppColors.greenStart,
//                                         fontSize: 16.sp,
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                     ),
//                                     style: TextButton.styleFrom(
//                                       padding: EdgeInsets.symmetric(vertical: 15.h),
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.only(
//                                           topRight: Radius.circular(20.r),
//                                           bottomRight: Radius.circular(20.r),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 15.h),
//                     // Tab bar for Learn and Categories
//                     Container(
//                       margin: EdgeInsets.symmetric(horizontal: 10.w),
//                       padding: EdgeInsets.all(5.h),
//                       width: 200,
//                       alignment: Alignment.centerLeft,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12.r),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black12,
//                             blurRadius: 5.r,
//                             offset: Offset(0, 3.h),
//                           ),
//                         ],
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Expanded(
//                             child: GestureDetector(
//                               onTap: () {
//                                 controller.onTabSelected(0);
//                               },
//                               child: Container(
//                                 padding: EdgeInsets.symmetric(vertical: 5.h),
//                                 decoration: BoxDecoration(
//                                   color: controller.selectedTabIndex.value == 0
//                                       ? AppColors.greenStart
//                                       : Colors.white,
//                                   borderRadius: BorderRadius.circular(12.r),
//                                 ),
//                                 child: Center(
//                                   child: Text(
//                                     "Learn",
//                                     style: TextStyle(
//                                       color: controller.selectedTabIndex.value == 0
//                                           ? Colors.white
//                                           : Colors.grey,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 12.sp,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             child: GestureDetector(
//                               onTap: () {
//                                 controller.onTabSelected(1);
//                               },
//                               child: Container(
//                                 padding: EdgeInsets.symmetric(vertical: 5.h),
//                                 decoration: BoxDecoration(
//                                   color: controller.selectedTabIndex.value == 1
//                                       ? AppColors.greenStart
//                                       : Colors.white,
//                                   borderRadius: BorderRadius.circular(12.r),
//                                 ),
//                                 child: Center(
//                                   child: Text(
//                                     "Categories",
//                                     style: TextStyle(
//                                       color: controller.selectedTabIndex.value == 1
//                                           ? Colors.white
//                                           : Colors.grey,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 12.sp,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 15.h),
//                     // Challenges cards
//                     Visibility(
//                       visible: controller.selectedTabIndex.value == 0,
//                       child: Container(
//                         margin: EdgeInsets.symmetric(horizontal: 20.w),
//                         padding: EdgeInsets.all(15.h),
//                         height: 170.h,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20.r),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black12,
//                               blurRadius: 10.r,
//                               offset: Offset(0, 5.h),
//                             ),
//                           ],
//                         ),
//                         child: ListView(
//                           scrollDirection: Axis.horizontal,
//                           children: [
//                             ...controller.weeklyChallenges.map((challenge) {
//                               return _challengeCard(
//                                 title: challenge['title']!,
//                                 image: challenge['image']!,
//                                 status: challenge['status']!,
//                                 color: challenge['color']!,
//                               );
//                             }),
//                             ...controller.monthlyChallenges.map((challenge) {
//                               return _challengeCard(
//                                 title: challenge['title']!,
//                                 image: challenge['image']!,
//                                 status: challenge['status']!,
//                                 color: challenge['color']!,
//                               );
//                             }),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20.h),
//                     // Community section
//                     Visibility(
//                       visible: controller.selectedTabIndex.value == 0,
//                       child: Container(
//                         margin: EdgeInsets.symmetric(horizontal: 20.w),
//                         padding: EdgeInsets.all(15.h),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20.r),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black12,
//                               blurRadius: 10.r,
//                               offset: Offset(0, 5.h),
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Community",
//                               style: TextStyle(
//                                 fontSize: 18.sp,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black87,
//                               ),
//                             ),
//                             // Menu popup overlay
//                             if (controller.isMenuOpen.value)
//                               Positioned(
//                                 top: 100.h,
//                                 left: 20.w,
//                                 right: 20.w,
//                                 child: Material(
//                                   elevation: 8,
//                                   borderRadius: BorderRadius.circular(12.r),
//                                   child: Container(
//                                     padding: EdgeInsets.symmetric(vertical: 10.h),
//                                     decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.circular(12.r),
//                                     ),
//                                     child: Column(
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: [
//                                         // Close icon
//                                         Align(
//                                           alignment: Alignment.topRight,
//                                           child: GestureDetector(
//                                             onTap: () {
//                                               controller.toggleMenu();
//                                             },
//                                             child: Padding(
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waste_grid/controller/home_controller.dart';
import 'package:waste_grid/pages/community/community_screen.dart';
import 'package:waste_grid/pages/scan/scan_screen.dart';
import 'package:waste_grid/utils/app_colors.dart';
import 'package:waste_grid/pages/profile/profile_settings_screen.dart';
import 'package:waste_grid/pages/earning/earning_screen.dart';
import 'package:waste_grid/pages/learn_and_earn/learn_and_earn_screen.dart';
import 'package:waste_grid/pages/recycle/recycle_screen.dart';
import 'package:waste_grid/pages/auth/login.dart';
import 'package:waste_grid/pages/profile/notification_screen.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  HomeScreen({super.key});

  Widget _menuItem(String title, dynamic onTap) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
      ),
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
      horizontalTitleGap: 0,
    );
  }

  Widget _challengeCard({
    required String title,
    required String image,
    required String status,
    required Color color,
  }) {
    return Container(
      width: 200.w,
      margin: EdgeInsets.only(right: 15.w),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Image.asset(
              image,
              width: 200.w,
              height: 150.h,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 10.h,
            right: 10.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: status == "Ongoing" ? Colors.white : Colors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                status,
                style: TextStyle(color: Colors.black, fontSize: 11.sp),
              ),
            ),
          ),
          Positioned(
            bottom: 10.h,
            left: 10.w,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(color: Colors.black, fontSize: 9.sp),
                  ),
                  Text(
                    "learn more",
                    style: TextStyle(color: Colors.black, fontSize: 7.sp),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _communityCard({required String title, required String image}) {
    return GestureDetector(
      onTap: () {
        Get.to(() => CommunityScreen());
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.25),
                    BlendMode.darken,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              title,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 10.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showMenuDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          elevation: 6,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Close icon
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      controller.toggleMenu();
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.w, top: 5.h),
                      child: Icon(Icons.close, size: 30.sp, color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                // Menu items with centered text
                ListTile(
                  title: Center(
                    child: Text(
                      "Earn",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Get.to(() => EarningScreen());
                  },
                  contentPadding: EdgeInsets.zero,
                  horizontalTitleGap: 0,
                ),

                // ... repeat other ListTiles similarly ...
                ListTile(
                  title: Center(
                    child: Text(
                      "Learn and earn",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  onTap: () {
                    Navigator.of(context).pop();
                    Get.to(() => LearnAndEarnScreen());
                  },
                  contentPadding: EdgeInsets.zero,
                  horizontalTitleGap: 0,
                ),
                ListTile(
                  title: Center(
                    child: Text(
                      "Recycle Center",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Get.to(() => RecycleScreen());
                  },
                  contentPadding: EdgeInsets.zero,
                  horizontalTitleGap: 0,
                ),
                ListTile(
                  title: Center(
                    child: Text(
                      "Scan",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Get.to(() => ScanScreen());
                  },
                  contentPadding: EdgeInsets.zero,
                  horizontalTitleGap: 0,
                ),
                ListTile(
                  title: Center(
                    child: Text(
                      "Waste Catalog",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Get.to(() => EarningScreen());
                  },
                  contentPadding: EdgeInsets.zero,
                  horizontalTitleGap: 0,
                ),
                ListTile(
                  title: Center(
                    child: Text(
                      "Community",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Get.to(() => CommunityScreen());
                  },
                  contentPadding: EdgeInsets.zero,
                  horizontalTitleGap: 0,
                ),
                const Divider(height: 1, color: Colors.grey),
                ListTile(
                  title: Center(
                    child: Text(
                      "Log out",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Get.offAll(() => LoginScreen());
                  },
                  contentPadding: EdgeInsets.zero,
                  horizontalTitleGap: 0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(360, 690), minTextAdapt: true);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Obx(() {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 20.h,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColors.greenStart, AppColors.greenEnd],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.r),
                          bottomRight: Radius.circular(30.r),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => ProfileSettingsScreen());
                                },
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 25.r,
                                      backgroundImage: AssetImage(
                                        'assets/images/profilepics.jpg',
                                      ),
                                    ),
                                    SizedBox(width: 12.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Hi, David Smith",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 4.h),
                                        Text(
                                          "Los Angeles, USA",
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      controller.isMenuOpen == true
                                          ? null
                                          : _showMenuDialog(context);
                                      controller.toggleMenu();
                                    },
                                    child: SvgPicture.asset(
                                      'assets/svgs/menu.svg',
                                      width: 24.w,
                                      height: 24.h,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 20.w),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => NotificationScreen());
                                    },
                                    child: Icon(
                                      Icons.notifications,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Container(
                            height: 100.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10.r,
                                  offset: Offset(0, 5.h),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextButton.icon(
                                    onPressed: () {
                                      controller.onScanPressed();
                                    },
                                    icon: SvgPicture.asset(
                                      'assets/svgs/scan.svg',
                                      width: 45.w,
                                      height: 45.h,
                                      color: AppColors.greenStart,
                                    ),
                                    label: Text(
                                      "Scan",
                                      style: TextStyle(
                                        color: AppColors.greenStart,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 15.h,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.r),
                                          bottomLeft: Radius.circular(20.r),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 1.w,
                                  height: 100.h,
                                  color: AppColors.greenStart.withOpacity(0.3),
                                ),
                                Expanded(
                                  child: TextButton.icon(
                                    onPressed: () {
                                      Get.to(() => EarningScreen());
                                    },
                                    icon: SvgPicture.asset(
                                      'assets/svgs/earn.svg',
                                      width: 50.w,
                                      height: 50.h,
                                      color: AppColors.greenStart,
                                    ),
                                    label: Text(
                                      "Earn",
                                      style: TextStyle(
                                        color: AppColors.greenStart,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 15.h,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20.r),
                                          bottomRight: Radius.circular(20.r),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.h),
                    if (controller.isMenuOpen.value == 12)
                      Positioned(
                        top: 100.h,
                        left: 20.w,
                        right: 20.w,
                        child: Material(
                          elevation: 8,
                          borderRadius: BorderRadius.circular(12.r),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Close icon
                                Align(
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.toggleMenu();
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        right: 10.w,
                                        top: 5.h,
                                      ),
                                      child: Icon(
                                        Icons.close,
                                        size: 30.sp,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                // Menu items with centered text
                                ListTile(
                                  title: Center(
                                    child: Text(
                                      "Earn",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  onTap: () => Get.to(() => EarningScreen()),
                                  contentPadding: EdgeInsets.zero,
                                  horizontalTitleGap: 0,
                                ),
                                ListTile(
                                  title: Center(
                                    child: Text(
                                      "Learn and earn",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  onTap: () =>
                                      Get.to(() => LearnAndEarnScreen()),
                                  contentPadding: EdgeInsets.zero,
                                  horizontalTitleGap: 0,
                                ),
                                ListTile(
                                  title: Center(
                                    child: Text(
                                      "Recycle Center",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  onTap: () => Get.to(() => RecycleScreen()),
                                  contentPadding: EdgeInsets.zero,
                                  horizontalTitleGap: 0,
                                ),
                                ListTile(
                                  title: Center(
                                    child: Text(
                                      "Waste Catalog",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  onTap: () => Get.to(() => EarningScreen()),
                                  contentPadding: EdgeInsets.zero,
                                  horizontalTitleGap: 0,
                                ),
                                ListTile(
                                  title: Center(
                                    child: Text(
                                      "Community",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  onTap: () => Get.to(() => EarningScreen()),
                                  contentPadding: EdgeInsets.zero,
                                  horizontalTitleGap: 0,
                                ),
                                ListTile(
                                  title: Center(
                                    child: Text(
                                      "Log out",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  onTap: () => Get.offAll(() => LoginScreen()),
                                  contentPadding: EdgeInsets.zero,
                                  horizontalTitleGap: 0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    SizedBox(height: 15.h),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      padding: EdgeInsets.all(5.h),
                      width: 200,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5.r,
                            offset: Offset(0, 3.h),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                controller.onTabSelected(0);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 5.h),
                                decoration: BoxDecoration(
                                  color: controller.selectedTabIndex.value == 0
                                      ? AppColors.greenStart
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Center(
                                  child: Text(
                                    "Learn",
                                    style: TextStyle(
                                      color:
                                          controller.selectedTabIndex.value == 0
                                          ? Colors.white
                                          : Colors.grey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                controller.onTabSelected(1);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 5.h),
                                decoration: BoxDecoration(
                                  color: controller.selectedTabIndex.value == 1
                                      ? AppColors.greenStart
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Center(
                                  child: Text(
                                    "Categories",
                                    style: TextStyle(
                                      color:
                                          controller.selectedTabIndex.value == 1
                                          ? Colors.white
                                          : Colors.grey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Visibility(
                      visible: controller.selectedTabIndex.value == 0,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        padding: EdgeInsets.all(15.h),
                        height: 170.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10.r,
                              offset: Offset(0, 5.h),
                            ),
                          ],
                        ),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            ...controller.weeklyChallenges.map((challenge) {
                              return _challengeCard(
                                title: challenge.title,
                                image: challenge.image,
                                status: challenge.status,
                                color: challenge.color,
                              );
                            }),
                            ...controller.monthlyChallenges.map((challenge) {
                              return _challengeCard(
                                title: challenge.title,
                                image: challenge.image,
                                status: challenge.status,
                                color: challenge.color,
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Visibility(
                      visible: controller.selectedTabIndex.value == 0,
                      child: Container(
                        padding: EdgeInsets.all(15.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10.h),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10.r,
                                    offset: Offset(0, 5.h),
                                  ),
                                ],
                              ),
                              child: Text(
                                "Community",
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            SizedBox(
                              height: 400,
                              child: GridView.builder(
                                physics:
                                    NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio:
                                          1.1,
                                    ),
                                itemCount: controller.communityImages.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final community =
                                      controller.communityImages[index];
                                  return _communityCard(
                                    title: community.title,
                                    image: community.image,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.onFloatingButtonPressed();
        },
        backgroundColor: AppColors.greenStart,
        child: Icon(Icons.chat_bubble_outline),
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: controller.selectedBottomIndex.value,
          onTap: (index) {
            controller.onBottomNavTapped(index);
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.greenStart,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.recycling),
              label: "Recycle",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: "Catalog",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        );
      }),
    );
  }
}
