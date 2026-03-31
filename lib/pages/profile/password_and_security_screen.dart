import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';
import '../../controller/password_and_security_controller.dart';

class PasswordAndSecurityScreen extends StatelessWidget {
  PasswordAndSecurityScreen({super.key});

  final PasswordAndSecurityController controller = Get.put(
    PasswordAndSecurityController(),
  );

  Widget _buildPasswordField({
    required String label,
    required RxString value,
    required bool obscureText,
    required VoidCallback toggleVisibility,
    required void Function(String) onChanged,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Obx(
        () => TextField(
          controller: TextEditingController(text: value.value),
          obscureText: obscureText,
          onChanged: onChanged,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: Colors.grey.shade600),
            suffixIcon: IconButton(
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
              onPressed: toggleVisibility,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: AppColors.mainColor),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 14.h,
            ),
          ),
        ),
      ),
    );
  }

  void _onDonePressed() {
    if (!controller.validatePasswords()) {
      Get.snackbar(
        'Error',
        'Passwords do not match or are less than 8 characters',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red.shade900,
      );
      return;
    }
    controller.saveSettings();
    Get.snackbar(
      'Success',
      'Password & Security settings saved',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.shade100,
      colorText: Colors.green.shade900,
    );
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Password & Security",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.mainColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Column(
          children: [
            _buildPasswordField(
              label: "New Password",
              value: controller.newPassword,
              obscureText: controller.obscureNewPassword.value,
              toggleVisibility: controller.toggleObscureNewPassword,
              onChanged: controller.updateNewPassword,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 12, top: 4),
                child: Text(
                  "Must contain 8 or more character",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ),
            ),
            _buildPasswordField(
              label: "Confirm Password",
              value: controller.confirmPassword,
              obscureText: controller.obscureConfirmPassword.value,
              toggleVisibility: controller.toggleObscureConfirmPassword,
              onChanged: controller.updateConfirmPassword,
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Obx(
                  () => Switch(
                    value: controller.allowFingerprint.value,
                    onChanged: controller.toggleAllowFingerprint,
                    activeColor: AppColors.mainColor,
                  ),
                ),
                const Text("Allow fingerprint ID"),
              ],
            ),
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
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 4, // Profile tab index
        onTap: (index) {
          switch (index) {
            case 0:
              Get.offAllNamed('/home');
              break;
            case 1:
              Get.offAllNamed('/recycle');
              break;
            case 2:
              Get.offAllNamed('/search');
              break;
            case 3:
              Get.offAllNamed('/catalog');
              break;
            case 4:
              break;
          }
        },
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.recycling),
            label: "Recycle",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: "Catalog",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
