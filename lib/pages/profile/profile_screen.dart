import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  final String userName = "David";
  final String userImageUrl =
      "https://randomuser.me/api/portraits/men/75.jpg"; 

  const ProfileScreen({super.key});

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
                  backgroundImage: NetworkImage(userImageUrl),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 4, 
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
