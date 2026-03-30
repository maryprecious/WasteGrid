import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final List<Map<String, String>> notifications = [
    {
      "text": "You were awarded 10points from learn and earn",
      "time": "10mins ago",
      "image": "assets/images/coins.png"
    },
    {
      "text": "You were awarded 10points from learn and earn",
      "time": "40mins ago",
      "image": "assets/images/coins.png"
    },
    {
      "text": "You were awarded 10points from your referral bonus",
      "time": "Yesterday",
      "image": "assets/images/coins.png"
    },
    {
      "text": "You were awarded 10points from today’s task",
      "time": "3days ago",
      "image": "assets/images/coins.png"
    },
    {
      "text": "You were awarded 10points from learn and earn",
      "time": "Last week",
      "image": "assets/images/coins.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notification",
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
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        itemCount: notifications.length,
        separatorBuilder: (context, index) => Divider(color: Colors.grey.shade300),
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(notification["image"]!),
              radius: 24.r,
            ),
            title: Text(
              notification["text"]!,
              style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
            ),
            trailing: Text(
              notification["time"]!,
              style: TextStyle(fontSize: 8.sp, color: Colors.grey.shade500),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 8.h),
          );
        },
      ),
    );
  }
}
