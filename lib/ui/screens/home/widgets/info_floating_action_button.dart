import 'package:flutter/material.dart';
import 'package:gapopa_flutter_vedant/shared/controllers/theme_controller.dart';
import 'package:gapopa_flutter_vedant/ui/screens/app_window/app_window_controller.dart';
import 'package:get/get.dart';

class InfoFloatingActionButton extends StatelessWidget {
  final appWindowController = Get.find<AppWindowController>();
  final themeController = Get.find<ThemeController>();

  InfoFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, 20),
      child: Obx(
        () {
          bool isWelcomeWindowOpen = appWindowController.hasWelcomeWindow();
          return FloatingActionButton.small(
            onPressed: isWelcomeWindowOpen
                ? () => appWindowController.removeWelcomeWindow()
                : () => appWindowController.launchInitWindow('Welcome'),
            backgroundColor: themeController.themeMode.value == ThemeMode.dark
                ? Colors.grey[850]
                : Colors.white,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              Icons.info_outlined,
              color: themeController.themeMode.value == ThemeMode.dark
                  ? Colors.white
                  : Colors.black,
              size: 22,
            ),
          );
        },
      ),
    );
  }
}
