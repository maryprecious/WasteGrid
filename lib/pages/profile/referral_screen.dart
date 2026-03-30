// Widget _buildReferralTab() {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         SizedBox(height: 24.h),
//         Image.asset(
//           'assets/images/referral_image.png',
//           width: 250.w,
//           height: 180.h,
//           fit: BoxFit.contain,
//           errorBuilder: (context, error, stackTrace) {
//             // Fallback if image not found
//             return SizedBox(
//               width: 250.w,
//               height: 180.h,
//               child: Center(
//                 child: Text(
//                   "Referral Image",
//                   style: TextStyle(color: Colors.grey.shade400, fontSize: 16.sp),
//                 ),
//               ),
//             );
//           },
//         ),
//         SizedBox(height: 24.h),
//         Text(
//           "Refer & Earn",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 20.sp,
//             color: Colors.black87,
//           ),
//         ),
//         SizedBox(height: 8.h),
//         Text(
//           "Refer your friends and family to earn 5 points per referral",
//           style: TextStyle(
//             fontSize: 14.sp,
//             color: Colors.grey.shade600,
//           ),
//           textAlign: TextAlign.center,
//         ),
//         SizedBox(height: 24.h),
//         Row(
//           children: [
//             Expanded(
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
//                 decoration: BoxDecoration(
//                   color: Colors.grey.shade200,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(12.r),
//                     bottomLeft: Radius.circular(12.r),
//                   ),
//                 ),
//                 child: Text(
//                   referralCode,
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16.sp,
//                     color: Colors.black87,
//                   ),
//                 ),
//               ),
//             ),
//             GestureDetector(
//               onTap: () => _copyToClipboard(referralCode, "Referral code copied"),
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
//                 decoration: BoxDecoration(
//                   color: AppColors.mainColor,
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(12.r),
//                     bottomRight: Radius.circular(12.r),
//                   ),
//                 ),
//                 child: Text(
//                   "Copy",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16.sp,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 16.h),
//         Container(
//           width: double.infinity,
//           padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
//           decoration: BoxDecoration(
//             color: Colors.grey.shade200,
//             borderRadius: BorderRadius.circular(12.r),
//           ),
//           child: Text(
//             referralLink,
//             style: TextStyle(
//               fontSize: 14.sp,
//               color: Colors.black87,
//             ),
//           ),
//         ),
//         SizedBox(height: 24.h),
//         SizedBox(
//           width: double.infinity,
//           height: 48.h,
//           child: ElevatedButton(
//             onPressed: () => _copyToClipboard(referralLink, "Referral link copied"),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: AppColors.mainColor,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12.r),
//               ),
//             ),
//             child: Text(
//               "Copy referral link",
//               style: TextStyle(
//                 fontSize: 16.sp,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
