import 'package:flutter/material.dart';
import 'package:gapopa_flutter_vedant/shared/controllers/theme_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeSettings extends StatelessWidget {
  ThemeSettings({super.key});

  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title for theme settings
          Text(
            'Default Theme Settings',
            style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),

          // Dark Mode toggle with dynamic functionality
          Obx(
            () => SwitchListTile(
              activeColor: Theme.of(context).primaryColor,
              secondary: const Icon(Icons.dark_mode, size: 24),
              title: Text(
                'Dark Mode',
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              value: themeController.themeMode.value == ThemeMode.dark,
              onChanged: (bool value) {
                themeController.toggleTheme();
              },
            ),
          ),
          const SizedBox(height: 10),

          // Optionally, you can add more settings or explanations here.
          Text(
            'Toggle the switch to change the app\'s theme.',
            style: GoogleFonts.roboto(
              color: Colors.black54,
              fontSize: 12, // Smaller text for the description
            ),
          ),
        ],
      ),
    );
  }
}
