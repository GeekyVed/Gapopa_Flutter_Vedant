import 'package:gapopa_flutter_vedant/shared/controllers/theme_controller.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
  }
}

void initializePreRunControllers() {
  Get.put(ThemeController());
}
