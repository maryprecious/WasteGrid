import 'package:get/get.dart';

class ReferralController extends GetxController {
  var selectedIndex = 0.obs;

  final String referralCode = "Pwaqert245";
  final String referralLink = "Pwaqert245QF6731999R61DGC.url";

  final friends = [
    {
      "name": "Lizzy Cairo",
      "joined": "Joined Today",
      "points": "300p",
      "avatar": "https://randomuser.me/api/portraits/women/65.jpg"
    },
    {
      "name": "Eddy Cairo",
      "joined": "Joined Today",
      "points": "300p",
      "avatar": "https://randomuser.me/api/portraits/men/43.jpg"
    },
    {
      "name": "Stitches Cairo",
      "joined": "Joined Today",
      "points": "300p",
      "avatar": "https://randomuser.me/api/portraits/men/12.jpg"
    },
    {
      "name": "Tosman Cairo",
      "joined": "Joined Today",
      "points": "300p",
      "avatar": "https://randomuser.me/api/portraits/men/56.jpg"
    },
    {
      "name": "Ay Cairo",
      "joined": "Joined Today",
      "points": "300p",
      "avatar": "https://randomuser.me/api/portraits/women/44.jpg"
    },
    {
      "name": "Ede Cairo",
      "joined": "Joined Today",
      "points": "300p",
      "avatar": "https://randomuser.me/api/portraits/men/22.jpg"
    },
  ];

  void selectTab(int index) {
    selectedIndex.value = index;
  }
}
