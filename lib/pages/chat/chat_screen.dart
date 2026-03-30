import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors.dart';
import '../../controller/chat_controller.dart';

class ChatScreen extends StatelessWidget {
  final ChatController controller = Get.put(ChatController());
  final TextEditingController textController = TextEditingController();

  ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(360, 690), minTextAdapt: true);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Text(
          'Text',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.mainColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                padding: EdgeInsets.all(12.w),
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final message = controller.messages[index];
                  return Align(
                    alignment: message.isUser
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 6.h),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        color: message.isUser
                            ? AppColors.greenStart
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        message.text,
                        style: TextStyle(
                          color: message.isUser ? Colors.white : Colors.black87,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: 'Add a Comment',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 12.h,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Obx(() {
                  return IconButton(
                    icon: Icon(Icons.send, color: AppColors.greenStart),
                    onPressed: () {
                      final text = textController.text.trim();
                      if (text.isNotEmpty) {
                        controller.sendMessage(text);
                        textController.clear();
                      }
                    },
                  );
                }),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed('/catalog');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.greenStart,
                padding: EdgeInsets.symmetric(vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
              ),
              child: Center(
                child: Text(
                  'Click here',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
