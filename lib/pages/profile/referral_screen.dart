import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';
import '../../controller/referral_controller.dart';

class ReferralScreen extends StatelessWidget {
  ReferralScreen({super.key});

  final ReferralController controller = Get.put(ReferralController());

  void _copyToClipboard(BuildContext context, String text, String message) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  Widget _buildTabs() {
    return Obx(() {
      return Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTabItem("Referral", 0),
            _buildTabItem("Friends", 1),
          ],
        ),
      );
    });
  }

  Widget _buildTabItem(String title, int index) {
    return Obx(() {
      final bool isSelected = controller.selectedIndex.value == index;
      return GestureDetector(
        onTap: () => controller.selectTab(index),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.mainColor : Colors.transparent,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: const Offset(0, 4),
                      blurRadius: 4,
                    ),
                  ]
                : null,
          ),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: isSelected ? Colors.white : Colors.black87,
            ),
          ),
        ),
      );
    });
  }

  Widget _buildReferralTab(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 24.h),
        Image.asset(
          'assets/images/referral_image.png',
          width: 250.w,
          height: 180.h,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return SizedBox(
              width: 250.w,
              height: 180.h,
              child: Center(
                child: Text(
                  "Referral Image",
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 16.sp),
                ),
              ),
            );
          },
        ),
        SizedBox(height: 24.h),
        Text(
          "Refer & Earn",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          "Refer your friends and family to earn 5 points per referral",
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey.shade600,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24.h),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    bottomLeft: Radius.circular(12.r),
                  ),
                ),
                child: Text(
                  controller.referralCode,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _copyToClipboard(context, controller.referralCode, "Referral code copied"),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12.r),
                    bottomRight: Radius.circular(12.r),
                  ),
                ),
                child: Text(
                  "Copy",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Text(
            controller.referralLink,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black87,
            ),
          ),
        ),
        SizedBox(height: 24.h),
        SizedBox(
          width: double.infinity,
          height: 48.h,
          child: ElevatedButton(
            onPressed: () => _copyToClipboard(context, controller.referralLink, "Referral link copied"),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.mainColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            child: Text(
              "Copy referral link",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFriendsTab(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24.h),
        Expanded(
          child: ListView.separated(
            itemCount: controller.friends.length,
            separatorBuilder: (context, index) => Divider(color: Colors.grey.shade300),
            itemBuilder: (context, index) {
              final friend = controller.friends[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(friend["avatar"]!),
                  radius: 24.r,
                ),
                title: Text(
                  friend["name"]!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                ),
                subtitle: Text(
                  friend["joined"]!,
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 12.sp),
                ),
                trailing: Text(
                  friend["points"]!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 8.h),
              );
            },
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 48.h,
          child: ElevatedButton(
            onPressed: () => _copyToClipboard(context, controller.referralLink, "Referral link copied"),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.mainColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            child: Text(
              "Copy referral link",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Referral",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.mainColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Column(
          children: [
            _buildTabs(),
            Expanded(
              child: Obx(() => controller.selectedIndex.value == 0
                  ? _buildReferralTab(context)
                  : _buildFriendsTab(context)),
            ),
          ],
        ),
      ),
    );
  }
}
