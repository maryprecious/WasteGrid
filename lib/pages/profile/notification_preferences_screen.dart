import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';
import '../../controller/notification_preferences_controller.dart';

class NotificationPreferencesScreen extends StatelessWidget {
  NotificationPreferencesScreen({super.key});

  final NotificationPreferencesController controller = Get.put(
    NotificationPreferencesController(),
  );

  Widget _buildSwitchTile(
    String title,
    RxBool value,
    void Function(bool) onChanged,
  ) {
    return Obx(
      () => SwitchListTile(
        title: Text(title, style: TextStyle(fontSize: 16.sp)),
        value: value.value,
        onChanged: onChanged,
        activeColor: AppColors.mainColor,
      ),
    );
  }

  void _onDonePressed() {
    controller.savePreferences();
    Get.snackbar(
      'Success',
      'Notification preferences saved',
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
          "Notification Preferences",
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
            _buildSwitchTile(
              "Push Notification",
              controller.pushNotification,
              controller.togglePushNotification,
            ),
            _buildSwitchTile(
              "Reminder",
              controller.reminder,
              controller.toggleReminder,
            ),
            _buildSwitchTile("Event", controller.event, controller.toggleEvent),
            _buildSwitchTile(
              "Community",
              controller.community,
              controller.toggleCommunity,
            ),
            _buildSwitchTile(
              "News letter",
              controller.newsletter,
              controller.toggleNewsletter,
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
