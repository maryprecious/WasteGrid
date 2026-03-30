import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Map',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
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
      body: const Center(
        child: Text('Map Screen Placeholder', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
