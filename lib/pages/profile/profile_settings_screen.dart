import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({super.key});

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  String userName = "David";
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green.shade100,
                ),
                padding: const EdgeInsets.all(4),
                child: CircleAvatar(
                  radius: 36,
                  backgroundImage: _image != null
                      ? FileImage(_image!)
                      : NetworkImage(
                              "https://randomuser.me/api/portraits/men/75.jpg",
                            )
                            as ImageProvider,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(4),
                    child: Icon(
                      Icons.edit,
                      size: 18,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Text(
            "Hi, $userName",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionItem(String title, VoidCallback onTap) {
    return ListTile(
      leading: _getIconForTitle(title),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.green,
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
    );
  }

  Icon _getIconForTitle(String title) {
    switch (title) {
      case "Personal information":
        return Icon(Icons.person_outline, color: Colors.grey.shade700);
      case "Password & Security":
        return Icon(Icons.lock_outline, color: Colors.grey.shade700);
      case "Notification Preferences":
        return Icon(Icons.notifications_none, color: Colors.grey.shade700);
      case "Location":
        return Icon(Icons.location_on_outlined, color: Colors.grey.shade700);
      case "FAQ":
        return Icon(Icons.help_outline, color: Colors.grey.shade700);
      case "Help Center":
        return Icon(Icons.info_outline, color: Colors.grey.shade700);
      case "Referral":
        return Icon(Icons.group_add_outlined, color: Colors.grey.shade700);
      default:
        return Icon(Icons.info_outline, color: Colors.grey.shade700);
    }
  }

  void _navigateTo(BuildContext context, String routeName) {
    Get.toNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(360, 690), minTextAdapt: true);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.white,

      body: ListView(
        children: [
          _buildProfileHeader(context),
          const Divider(height: 1),
          _buildOptionItem(
            "Personal information",
            () => _navigateTo(context, '/personal_information'),
          ),
          _buildOptionItem(
            "Password & Security",
            () => _navigateTo(context, '/password_and_security'),
          ),
          _buildOptionItem(
            "Notification Preferences",
            () => _navigateTo(context, '/notification_preferences'),
          ),
          _buildOptionItem("Location", () => _navigateTo(context, '/location')),
          _buildOptionItem("FAQ", () => _navigateTo(context, '/faq')),
          _buildOptionItem(
            "Help Center",
            () => _navigateTo(context, '/help_center'),
          ),
          _buildOptionItem("Referral", () => _navigateTo(context, '/referral')),
        ],
      ),
    );
  }
}
