import 'package:get/get.dart';

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});
}

class ChatController extends GetxController {
  var messages = <ChatMessage>[].obs;
  var isTyping = false.obs;

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;

    messages.add(ChatMessage(text: text, isUser: true));
    isTyping.value = true;
    Future.delayed(Duration(seconds: 2), () {
      final response = generateAIResponse(text);
      messages.add(ChatMessage(text: response, isUser: false));
      isTyping.value = false;
    });
  }

  String generateAIResponse(String userInput) {
    final input = userInput.toLowerCase();
    if (input.contains('dispose') || input.contains('recycle')) {
      return 'You can recycle plastic bottles at our nearest recycle centers. Check the catalog for more info.';
    } else if (input.contains('plastic')) {
      return 'Plastic bottles should be cleaned and placed in the recycling bin.';
    } else if (input.contains('metal')) {
      return 'Metal cans are recyclable and can be taken to any recycle center.';
    } else {
      return 'I\'m here to help! Please ask me about recycling or product disposal.';
    }
  }

  void clearChat() {
    messages.clear();
  }
}
