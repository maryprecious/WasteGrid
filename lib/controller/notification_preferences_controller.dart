import 'package:get/get.dart';

class NotificationPreferencesController extends GetxController {
  var pushNotification = true.obs;
  var reminder = true.obs;
  var event = true.obs;
  var community = true.obs;
  var newsletter = true.obs;

  void togglePushNotification(bool value) {
    pushNotification.value = value;
  }

  void toggleReminder(bool value) {
    reminder.value = value;
  }

  void toggleEvent(bool value) {
    event.value = value;
  }

  void toggleCommunity(bool value) {
    community.value = value;
  }

  void toggleNewsletter(bool value) {
    newsletter.value = value;
  }

  void savePreferences() {
    print('Notification Preferences saved:');
    print('Push Notification: \$pushNotification');
    print('Reminder: \$reminder');
    print('Event: \$event');
    print('Community: \$community');
    print('Newsletter: \$newsletter');
  }
}
