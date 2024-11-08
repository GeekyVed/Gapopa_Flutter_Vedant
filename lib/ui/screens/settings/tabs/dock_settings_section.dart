import 'package:flutter/material.dart';
import 'package:gapopa_flutter_vedant/shared/controllers/dock_settings_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DockSettingsSection extends StatelessWidget {
  final DockSettingsController controller = Get.find();

  DockSettingsSection({super.key});

  // Helper method for building sliders with RxDouble values
  Widget _buildDoubleSlider({
    required String title,
    required String subtitle,
    required RxDouble value,
    required double min,
    required double max,
    int? divisions,
    String? suffix,
  }) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.roboto(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.8),
                  ),
                ),
                Text(
                  '${value.value.toStringAsFixed(2)}${suffix ?? ''}',
                  style: GoogleFonts.roboto(
                    fontSize: 11,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: GoogleFonts.roboto(
                fontSize: 11,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            const SizedBox(height: 6),
            SliderTheme(
              data: SliderThemeData(
                activeTrackColor: const Color(0xFF007AFF),
                inactiveTrackColor: Colors.grey[200],
                thumbColor: Colors.white,
                overlayColor: const Color(0xFF007AFF).withOpacity(0.1),
                trackHeight: 3,
                thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 7,
                  elevation: 1,
                ),
              ),
              child: Slider(
                value: value.value,
                min: min,
                max: max,
                divisions: divisions,
                onChanged: (newValue) => value.value = newValue,
              ),
            ),
            const SizedBox(height: 12),
          ],
        ));
  }

  // Helper method for building sliders with RxInt values
  Widget _buildIntSlider({
    required String title,
    required String subtitle,
    required RxInt value,
    required double min,
    required double max,
    int? divisions,
    String? suffix,
  }) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.roboto(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.8),
                  ),
                ),
                Text(
                  '${value.value}${suffix ?? ''}',
                  style: GoogleFonts.roboto(
                    fontSize: 11,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: GoogleFonts.roboto(
                fontSize: 11,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            const SizedBox(height: 6),
            SliderTheme(
              data: SliderThemeData(
                activeTrackColor: const Color(0xFF007AFF),
                inactiveTrackColor: Colors.grey[200],
                thumbColor: Colors.white,
                overlayColor: const Color(0xFF007AFF).withOpacity(0.1),
                trackHeight: 3,
                thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 7,
                  elevation: 1,
                ),
              ),
              child: Slider(
                value: value.value.toDouble(),
                min: min,
                max: max,
                divisions: divisions,
                onChanged: (newValue) => value.value = newValue.round(),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ));
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: GoogleFonts.roboto(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.black.withOpacity(0.8),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Scaling Section
            _buildSectionHeader('Scaling'),
            _buildDoubleSlider(
              title: 'Hover Scale',
              subtitle: 'Scale factor when hovering over an icon',
              value: controller.hoverScale,
              min: 1.0,
              max: 2.5,
              divisions: 30,
              suffix: 'x',
            ),
            _buildDoubleSlider(
              title: 'Neighbor Scale',
              subtitle: 'Scale factor for icons next to hovered icon',
              value: controller.neighborScale,
              min: 1.0,
              max: 2.0,
              divisions: 20,
              suffix: 'x',
            ),
            _buildDoubleSlider(
              title: 'Second Neighbor Scale',
              subtitle: 'Scale factor for second-level neighboring icons',
              value: controller.secondNeighborScale,
              min: 1.0,
              max: 1.8,
              divisions: 16,
              suffix: 'x',
            ),

            const SizedBox(height: 20),

            // Animation Timing Section
            _buildSectionHeader('Animation Timing'),
            _buildIntSlider(
              title: 'Shrink Duration',
              subtitle: 'Duration of the shrink animation when removing icons',
              value: controller.shrinkAnimationDuration,
              min: 100,
              max: 1000,
              divisions: 18,
              suffix: 'ms',
            ),
            _buildIntSlider(
              title: 'Hover Duration',
              subtitle: 'Duration of the hover scaling animation',
              value: controller.hoverAnimationDuration,
              min: 100,
              max: 500,
              divisions: 8,
              suffix: 'ms',
            ),

            const SizedBox(height: 20),

            // Visual Effects Section
            _buildSectionHeader('Visual Effects'),
            _buildDoubleSlider(
              title: 'Backdrop Blur',
              subtitle: 'Blur intensity of the dock background',
              value: controller.containerBlur,
              min: 0,
              max: 20,
              divisions: 20,
            ),
            _buildDoubleSlider(
              title: 'Background Opacity',
              subtitle: 'Opacity of the dock background',
              value: controller.containerOpacity,
              min: 0,
              max: 1,
              divisions: 20,
            ),

            const SizedBox(height: 20),

            // Size and Thresholds Section
            _buildSectionHeader('Size and Thresholds'),
            _buildDoubleSlider(
              title: 'Base Icon Size',
              subtitle: 'Default size of dock icons',
              value: controller.baseItemHeight,
              min: 32,
              max: 64,
              divisions: 16,
              suffix: 'px',
            ),
            _buildDoubleSlider(
              title: 'Remove Threshold',
              subtitle: 'Distance to drag up for removing icons',
              value: controller.removeThreshold,
              min: 50,
              max: 200,
              divisions: 30,
              suffix: 'px',
            ),

            const SizedBox(height: 24),

            // Reset Button (macOS style)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: const Color(0xFFD1D1D6),
                      width: 0.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 1,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(6),
                      onTap: controller.resetToDefaults,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.refresh,
                              size: 16,
                              color: Colors.black.withOpacity(0.8),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Reset to Defaults',
                              style: GoogleFonts.roboto(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
