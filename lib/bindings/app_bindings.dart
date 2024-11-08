import 'package:gapopa_flutter_vedant/shared/controllers/dock_settings_controller.dart';
import 'package:gapopa_flutter_vedant/shared/controllers/theme_controller.dart';
import 'package:gapopa_flutter_vedant/ui/screens/app_window/app_window_controller.dart';
import 'package:gapopa_flutter_vedant/ui/screens/home/dock_controller.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(DockController());
    Get.lazyPut(() => AppWindowController());
    Get.lazyPut(() => DockSettingsController());
  }
}

void initializePreRunControllers() {
  Get.put(ThemeController());
}
