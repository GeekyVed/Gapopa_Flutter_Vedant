import 'package:flutter/material.dart';
import 'package:gapopa_flutter_vedant/shared/constants/app_colors.dart';
import 'package:gapopa_flutter_vedant/shared/controllers/theme_controller.dart';
import 'package:gapopa_flutter_vedant/ui/screens/home/dock_controller.dart';
import 'package:gapopa_flutter_vedant/ui/screens/home/widgets/custom_floating_action_button.dart';
import 'package:gapopa_flutter_vedant/ui/screens/home/widgets/dock_container.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final dockController = Get.find<DockController>();
    return Scaffold(
      floatingActionButton: CustomFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Stack(
        children: [
          Obx(
            () => Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    themeController.themeMode.value == ThemeMode.dark
                        ? AppColors.darkPrimary
                        : AppColors.lightPrimary,
                    themeController.themeMode.value == ThemeMode.dark
                        ? AppColors.darkAccent
                        : AppColors.lightAccent,
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const DockContainer(),
                const SizedBox(height: 13),
              ],
            ),
          ),
          Obx(() {
            return Positioned.fill(
              child: Stack(
                children: dockController.windows.map((window) {
                  return window; // Render each window from the controller's windows list
                }).toList(),
              ),
            );
          }),
        ],
      ),
    );
  }
}
