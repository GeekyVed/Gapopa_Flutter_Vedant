import 'package:flutter/material.dart';
import 'package:gapopa_flutter_vedant/shared/controllers/theme_controller.dart';
import 'package:get/get.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final themeController = Get.find<ThemeController>();

  CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, 20),
      child: Obx(
        () => FloatingActionButton.small(
          onPressed: () {
            themeController.toggleTheme();
          },
          backgroundColor: themeController.themeMode.value == ThemeMode.dark
              ? Colors.grey[850]
              : Colors.white,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(
            themeController.themeMode.value == ThemeMode.dark
                ? Icons.brightness_7
                : Icons.brightness_4,
            color: themeController.themeMode.value == ThemeMode.dark
                ? Colors.white
                : Colors.black,
            size: 22,
          ),
        ),
      ),
    );
  }
}
