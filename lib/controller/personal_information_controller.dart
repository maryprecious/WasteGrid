import 'package:get/get.dart';

class PersonalInformationController extends GetxController {
  var fullName = ''.obs;
  var email = ''.obs;
  var phone = ''.obs;

  void updateFullName(String value) {
    fullName.value = value;
  }

  void updateEmail(String value) {
    email.value = value;
  }

  void updatePhone(String value) {
    phone.value = value;
  }

  void savePersonalInformation() {
    print('Saved Personal Information:');
    print('Full Name: \$fullName');
    print('Email: \$email');
    print('Phone: \$phone');
  }
}
