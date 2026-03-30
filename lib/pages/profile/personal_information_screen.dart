import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';
import '../../controller/personal_information_controller.dart';

class PersonalInformationScreen extends StatelessWidget {
  PersonalInformationScreen({super.key});

  final PersonalInformationController controller = Get.put(
    PersonalInformationController(),
  );

  Widget _buildTextField({
    required String hintText,
    required String label,
    required RxString value,
    required void Function(String) onChanged,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Obx(
        () => TextField(
          controller: TextEditingController(text: value.value),
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            labelText: label,
            labelStyle: TextStyle(color: Colors.grey.shade600),
            suffixIcon: Icon(Icons.edit, color: Colors.green),
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
    controller.savePersonalInformation();
    Get.snackbar(
      'Success',
      'Personal information saved',
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
          "Personal information",
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
            _buildTextField(
              label: "Full Name",
              hintText: "Chiamaka",
              value: controller.fullName,
              onChanged: controller.updateFullName,
            ),
            _buildTextField(
              label: "Email",
              hintText: "eddyzubike93@gmail.com",
              value: controller.email,
              onChanged: controller.updateEmail,
            ),
            _buildTextField(
              label: "Phone",
              hintText: "234| 080937****5",
              value: controller.phone,
              onChanged: controller.updatePhone,
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
              // Already on profile
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
