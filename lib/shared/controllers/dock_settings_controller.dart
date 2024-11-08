import 'package:get/get.dart';

class DockSettingsController extends GetxController {
  // Animation Durations (in milliseconds)
  final RxInt shrinkAnimationDuration = 300.obs;
  final RxInt hoverAnimationDuration = 252.obs;
  final RxInt containerAnimationDuration = 960.obs;

  // Scaling Factors
  final RxDouble hoverScale = 1.75.obs;
  final RxDouble neighborScale = 1.43.obs;
  final RxDouble secondNeighborScale = 1.28.obs;
  final RxDouble normalScale = 1.0.obs;

  // Base Sizes (in pixels)
  final RxDouble baseItemHeight = 48.0.obs;

  // Thresholds (in pixels)
  final RxDouble removeThreshold = 75.0.obs;

  // Opacity and Blur (in range)
  final RxDouble containerBlur = 10.0.obs;
  final RxDouble containerOpacity = 0.2.obs;
  final RxDouble dragContainerOpacity = 0.1.obs;

  // Reset to default settings
  void resetToDefaults() {
    shrinkAnimationDuration.value = 300;
    hoverAnimationDuration.value = 252;
    containerAnimationDuration.value = 960;

    hoverScale.value = 1.75;
    neighborScale.value = 1.43;
    secondNeighborScale.value = 1.28;
    normalScale.value = 1.0;

    baseItemHeight.value = 48.0;
    removeThreshold.value = 75.0;

    containerBlur.value = 10.0;
    containerOpacity.value = 0.2;
    dragContainerOpacity.value = 0.1;
  }

  // Add getter methods for specific settings if needed for clarity:
  double get shrinkDuration => shrinkAnimationDuration.value.toDouble();
  double get hoverDuration => hoverAnimationDuration.value.toDouble();
  double get containerDuration => containerAnimationDuration.value.toDouble();
  double get scaleNormal => normalScale.value;
  double get scaleHover => hoverScale.value;
  double get scaleNeighbor => neighborScale.value;
  double get scaleSecondNeighbor => secondNeighborScale.value;
  double get itemHeight => baseItemHeight.value;
  double get threshold => removeThreshold.value;
  double get blur => containerBlur.value;
  double get opacity => containerOpacity.value;
  double get dragOpacity => dragContainerOpacity.value;
}
