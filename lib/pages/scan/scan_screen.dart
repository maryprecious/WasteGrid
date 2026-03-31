import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../utils/app_colors.dart';
import '../../controller/scan_controller.dart';
import '../profile/map_screen.dart';

class ScanScreen extends StatelessWidget {
  final ScanController controller = Get.put(ScanController());

  ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(360, 690), minTextAdapt: true);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Text(
          'Scan',
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
      body: Obx(() {
        if (controller.scanState.value == 0) {
          return _buildInitialScan();
        } else if (controller.scanState.value == 1) {
          return _buildScanning();
        } else if (controller.scanState.value == 2) {
          return _buildScanResult();
        } else {
          return Container();
        }
      }),
      // bottomNavigationBar: Obx(() {
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        onTap: (index) {
          switch (index) {
            case 0:
              Get.toNamed('/home');
              break;
            case 1:
              Get.toNamed('/recycle');
              break;
            case 2:
              break;
            case 3:
              Get.toNamed('/catalog');
              break;
            case 4:
              Get.toNamed('/profile');
              break;
          }
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.greenStart,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.recycling),
            label: 'Recycle',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Scan'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Catalog'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      // }),
    );
  }

  Widget _buildInitialScan() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                width: 250.w,
                height: 250.w,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.greenStart, width: 3.w),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 20.h,
                      left: 20.w,
                      child: Container(
                        width: 40.w,
                        height: 3.w,
                        color: AppColors.greenStart,
                      ),
                    ),
                    Positioned(
                      top: 20.h,
                      right: 20.w,
                      child: Container(
                        width: 40.w,
                        height: 3.w,
                        color: AppColors.greenStart,
                      ),
                    ),
                    Positioned(
                      bottom: 20.h,
                      left: 20.w,
                      child: Container(
                        width: 40.w,
                        height: 3.w,
                        color: AppColors.greenStart,
                      ),
                    ),
                    Positioned(
                      bottom: 20.h,
                      right: 20.w,
                      child: Container(
                        width: 40.w,
                        height: 3.w,
                        color: AppColors.greenStart,
                      ),
                    ),
                    Positioned(
                      top: 20.h,
                      left: 20.w,
                      child: Container(
                        width: 3.w,
                        height: 40.w,
                        color: AppColors.greenStart,
                      ),
                    ),
                    Positioned(
                      top: 20.h,
                      right: 20.w,
                      child: Container(
                        width: 3.w,
                        height: 40.w,
                        color: AppColors.greenStart,
                      ),
                    ),
                    Positioned(
                      bottom: 20.h,
                      left: 20.w,
                      child: Container(
                        width: 3.w,
                        height: 40.w,
                        color: AppColors.greenStart,
                      ),
                    ),
                    Positioned(
                      bottom: 20.h,
                      right: 20.w,
                      child: Container(
                        width: 3.w,
                        height: 40.w,
                        color: AppColors.greenStart,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            'Point your camera at the product barcode that you want to identify',
            style: TextStyle(color: Colors.grey.shade600, fontSize: 14.sp),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  controller.startScan();
                },
                icon: Icon(Icons.qr_code_scanner),
                label: Text('Start Scan'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.greenStart,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 12.h,
                  ),
                  textStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
              ),
              SizedBox(width: 20.w),
              ElevatedButton.icon(
                onPressed: () {
                  Get.snackbar('Info', 'Camera snap not implemented yet');
                },
                icon: Icon(Icons.camera_alt),
                label: Text('Snap Photo'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                  foregroundColor: Colors.black87,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 12.h,
                  ),
                  textStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }

  Widget _buildScanning() {
    return MobileScanner(
      controller: controller.mobileScannerController,
      onDetect: controller.onBarcodeDetected,
      fit: BoxFit.contain,
      fit: BoxFit.contain,
    );
  }

  Widget _buildScanResult() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Colors.grey.shade300,
            ),
            child: Center(
              child: Icon(
                Icons.image,
                size: 100.sp,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Obx(
            () => Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: controller.recyclable.value
                    ? Colors.green.shade100
                    : Colors.red.shade100,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.recycling,
                    color: controller.recyclable.value
                        ? Colors.green
                        : Colors.red,
                    size: 20.sp,
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    controller.recyclable.value
                        ? 'Recyclable'
                        : 'Not Recyclable',
                    style: TextStyle(
                      color: controller.recyclable.value
                          ? Colors.green
                          : Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            'The Product barcode has been recognized as',
            style: TextStyle(fontSize: 14.sp, color: Colors.black87),
          ),
          SizedBox(height: 6.h),
          Obx(
            () => Text(
              controller.barcode.value,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
            ),
          ),
          SizedBox(height: 10.h),
          _buildDetailRow('Product Type:', controller.productType.value),
          _buildDetailRow('Manufacturer:', controller.manufacturer.value),
          _buildDetailRow(
            'Country of Origin:',
            controller.countryOfOrigin.value,
          ),
          _buildDetailRow('Production Date:', controller.productionDate.value),
          _buildDetailRow('Expiration Date:', controller.expirationDate.value),
          SizedBox(height: 20.h),
          ElevatedButton(
            onPressed: () {
              Get.to(() => MapScreen());
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
                'Find the nearest location',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 12.h),
          OutlinedButton(
            onPressed: () {
              Get.toNamed('/catalog');
            },
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: AppColors.greenStart),
              padding: EdgeInsets.symmetric(vertical: 14.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.r),
              ),
            ),
            child: Center(
              child: Text(
                'Learn how to recycle',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.greenStart,
                ),
              ),
            ),
          ),
          SizedBox(height: 12.h),
          OutlinedButton(
            onPressed: () {
              controller.resetScan();
              controller.startScan();
            },
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: AppColors.greenStart),
              padding: EdgeInsets.symmetric(vertical: 14.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.r),
              ),
            ),
            child: Center(
              child: Text(
                'Scan again',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.greenStart,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed('/chat');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.greenStart,
                padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
              ),
              child: Text(
                'T',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(value, style: TextStyle(fontSize: 14.sp)),
          ),
        ],
      ),
    );
  }
}

class ScannerOverlay extends StatelessWidget {
  const ScannerOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _ScannerOverlayPainter(), child: Container());
  }
}

class _ScannerOverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: size.width * 0.7,
      height: size.height * 0.5,
    );

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
