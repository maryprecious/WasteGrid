import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationController extends GetxController {
  var allowLocation = true.obs;
  var nationality = ''.obs;

  Future<bool> requestLocationPermission() async {
    var status = await Permission.location.status;
    if (!status.isGranted) {
      status = await Permission.location.request();
    }
    return status.isGranted;
  }

  void updateAllowLocation(bool value) {
    allowLocation.value = value;
    if (value) {
      requestLocationPermission();
    }
  }

  void updateNationality(String value) {
    nationality.value = value;
  }

  void navigateToMap() {
    Get.toNamed('/map');
  }

  void saveSettings() {
    // Save logic here, e.g., API call or local storage
    print('Location settings saved:');
    print('Allow Location: \$allowLocation');
    print('Nationality: \$nationality');
  }
}
