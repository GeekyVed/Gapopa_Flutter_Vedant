import 'package:flutter/material.dart';
import 'package:gapopa_flutter_vedant/shared/constants/app_colors.dart';
import 'package:gapopa_flutter_vedant/shared/controllers/theme_controller.dart';
import 'package:gapopa_flutter_vedant/ui/screens/app_window/app_window_controller.dart';
import 'package:gapopa_flutter_vedant/ui/screens/home/widgets/custom_floating_action_button.dart';
import 'package:gapopa_flutter_vedant/ui/screens/home/widgets/dock_container.dart';
import 'package:gapopa_flutter_vedant/ui/screens/home/widgets/info_floating_action_button.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final appWindowController = Get.find<AppWindowController>();
    return Scaffold(
      floatingActionButton: Column(
        children: [
          CustomFloatingActionButton(),
          SizedBox(
            height: 10,
          ),
          InfoFloatingActionButton(),
        ],
      ),
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
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 150,
            left: MediaQuery.of(context).size.width / 2 - 125,
            child: Image.asset(
              'assets/apple_logo.png',
              width: 250,
              height: 250,
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
                children: appWindowController.windows.map((window) {
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
