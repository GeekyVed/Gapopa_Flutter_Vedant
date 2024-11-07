import 'package:flutter/material.dart';
import 'package:gapopa_flutter_vedant/shared/constants/app_colors.dart';
import 'package:gapopa_flutter_vedant/shared/controllers/theme_controller.dart';
import 'package:gapopa_flutter_vedant/ui/screens/home/dock_controller.dart';
import 'package:gapopa_flutter_vedant/ui/screens/settings/widgets/about_section.dart';
import 'package:gapopa_flutter_vedant/ui/screens/settings/widgets/dock_icon_settings.dart';
import 'package:gapopa_flutter_vedant/ui/screens/settings/widgets/theme_settings.dart';
import 'package:get/get.dart';

class DockSettingsPanel extends StatefulWidget {
  const DockSettingsPanel({super.key});

  @override
  State<DockSettingsPanel> createState() => _DockSettingsPanelState();
}

class _DockSettingsPanelState extends State<DockSettingsPanel> {
  int _selectedIndex = 0;
  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    final DockController controller = Get.find();

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(right: Radius.circular(12)),
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
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              children: [
                // Status bar with close, minimize, and expand buttons (macOS-like)
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _statusDot(
                          color: Colors.red,
                          onPressed: () {
                            Get.back();
                          }),
                      const SizedBox(width: 12),
                      _statusDot(color: Colors.orange, onPressed: () {}),
                      const SizedBox(width: 12),
                      _statusDot(color: Colors.green, onPressed: () {}),
                    ],
                  ),
                ),
                // Menu List
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      _menuItem('Dock Icons', 0, 'assets/icons/icons.png'),
                      _menuItem('Default Theme', 1, 'assets/icons/theme.png'),
                      _menuItem('About', 2, 'assets/icons/dev.png'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Main Content Area
          Expanded(
            child: Column(
              children: [
                // Title Section Above the Content
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    _getTitleForSelectedIndex(),
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                // Content Area
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Builder(
                      builder: (context) {
                        switch (_selectedIndex) {
                          case 0:
                            return DockIconsSettings(controller: controller);
                          case 1:
                            return ThemeSettings();
                          case 2:
                            return const AboutSection();
                          default:
                            return const SizedBox.shrink();
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to create macOS-style status dots
  Widget _statusDot({required Color color, required VoidCallback? onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 13,
        height: 13,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }

  // Helper method to create macOS-style menu items with custom layout
  Widget _menuItem(String title, int index, String icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        color: _selectedIndex == index
            ? Colors.blue.withOpacity(0.2)
            : Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Row(
            children: [
              // Icon
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: AssetImage(icon),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Title Text
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to return title based on selected index
  String _getTitleForSelectedIndex() {
    switch (_selectedIndex) {
      case 0:
        return 'Dock Icons Settings';
      case 1:
        return 'Theme Settings';
      case 2:
        return 'About';
      default:
        return '';
    }
  }
}
