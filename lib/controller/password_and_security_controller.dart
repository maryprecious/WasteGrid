import 'package:get/get.dart';

class PasswordAndSecurityController extends GetxController {
  var newPassword = ''.obs;
  var confirmPassword = ''.obs;
  var allowFingerprint = true.obs;
  var obscureNewPassword = true.obs;
  var obscureConfirmPassword = true.obs;

  void updateNewPassword(String value) {
    newPassword.value = value;
  }

  void updateConfirmPassword(String value) {
    confirmPassword.value = value;
  }

  void toggleAllowFingerprint(bool value) {
    allowFingerprint.value = value;
  }

  void toggleObscureNewPassword() {
    obscureNewPassword.value = !obscureNewPassword.value;
  }

  void toggleObscureConfirmPassword() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }

  bool validatePasswords() {
    if (newPassword.value.length < 8) {
      return false;
    }
    if (newPassword.value != confirmPassword.value) {
      return false;
    }
    return true;
  }

  void saveSettings() {
    if (!validatePasswords()) {
      // Handle validation failure, e.g., show error message
      print('Password validation failed');
      return;
    }
    // Save logic here, e.g., API call or local storage
    print('Password & Security settings saved');
    print('New Password: \$newPassword');
    print('Allow Fingerprint: \$allowFingerprint');
  }
}
