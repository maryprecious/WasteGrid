import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:waste_grid/pages/learn_and_earn/learn_and_earn_screen.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  final TextEditingController _searchController = TextEditingController();

  void _onDonePressed() {
    // TODO: Implement any save or search logic if needed
    Navigator.of(context).pop();
  }

  Widget _buildFaqItem(String title, VoidCallback onTap) {
    return ListTile(
      title: Text(title, style: TextStyle(fontSize: 16.sp)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.green),
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 24.w),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "FAQ",
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
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Ask",
                prefixIcon: Icon(Icons.search, color: AppColors.mainColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              ),
            ),
            SizedBox(height: 16.h),
            _buildFaqItem("Learn and Earn", () {
              Get.to(() => const LearnAndEarnScreen());
              // TODO: Implement navigation or action
            }),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton(
                onPressed: _onDonePressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: const Text(
                  "Done",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
