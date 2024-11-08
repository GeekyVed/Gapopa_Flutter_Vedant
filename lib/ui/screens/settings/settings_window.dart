import 'package:flutter/material.dart';
import 'package:gapopa_flutter_vedant/ui/screens/settings/tabs/dock_settings_section.dart';
import 'package:get/get.dart';
import 'package:gapopa_flutter_vedant/shared/constants/app_colors.dart';
import 'package:gapopa_flutter_vedant/shared/controllers/theme_controller.dart';
import 'package:gapopa_flutter_vedant/ui/screens/settings/tabs/about_section.dart';
import 'package:gapopa_flutter_vedant/ui/screens/settings/tabs/dock_icon_settings.dart';
import 'package:gapopa_flutter_vedant/ui/screens/settings/tabs/theme_settings.dart';

class SettingsWindow extends StatefulWidget {
  final String app;
  final VoidCallback onClose;

  const SettingsWindow({super.key, required this.onClose, required this.app});

  @override
  SettingsWindowState createState() => SettingsWindowState();
}

class SettingsWindowState extends State<SettingsWindow> {
  Offset _position = Offset(100, 100);
  Offset _dragStartPosition = Offset.zero;
  Offset _dragOffset = Offset.zero;
  int _selectedIndex = 0;
  final themeController = Get.find<ThemeController>();

  // Update position when dragging
  void _onPanStart(DragStartDetails details) {
    setState(() {
      _dragStartPosition = details.localPosition;
    });
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _dragOffset = details.localPosition - _dragStartPosition;
      _position = _position + _dragOffset;
      _dragStartPosition = details.localPosition;
    });
  }

  void _onPanEnd(DragEndDetails details) {
    setState(() {
      _dragOffset = Offset.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _position.dx,
      top: _position.dy,
      child: GestureDetector(
        onPanStart: _onPanStart,
        onPanUpdate: _onPanUpdate,
        onPanEnd: _onPanEnd,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: 800,
            height: 600,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 10,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Row(
              children: [
                Obx(
                  () => Container(
                    width: 220,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(24)),
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
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _statusDot(
                                  color: Colors.red,
                                  onPressed:
                                      widget.onClose), // Call onClose to close
                              const SizedBox(width: 12),
                              _statusDot(
                                  color: Colors.orange, onPressed: () {}),
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
                              _menuItem(
                                  'Dock Icons', 0, 'assets/icons/icons.png'),
                              _menuItem('Dock Settings', 1,
                                  'assets/icons/settings.png'), // New Menu Item for Dock Settings
                              _menuItem(
                                  'Default Theme', 2, 'assets/icons/theme.png'),
                              _menuItem('About', 3, 'assets/icons/dev.png'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Main Content Area
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(24)),
                        ),
                        child: Text(
                          _getTitleForSelectedIndex(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
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
                                  return DockIconsSettings();
                                case 1:
                                  return DockSettingsSection();
                                case 2:
                                  return ThemeSettings();
                                case 3:
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
          ),
        ),
      ),
    );
  }

  // Helper method to create macOS-style status dots
  Widget _statusDot({required Color color, required VoidCallback? onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 12,
        height: 12,
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
                      fontSize: 13,
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
        return 'Dock Settings';
      case 2:
        return 'Theme Settings';
      case 3:
        return 'About';
      default:
        return '';
    }
  }
}
