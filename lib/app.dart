import 'package:flutter/material.dart';
import 'package:gapopa_flutter_vedant/bindings/app_bindings.dart';
import 'package:gapopa_flutter_vedant/config/router/app_pages.dart';
import 'package:gapopa_flutter_vedant/config/router/app_routes.dart';
import 'package:gapopa_flutter_vedant/shared/themes/app_theme.dart';
import 'package:gapopa_flutter_vedant/shared/controllers/theme_controller.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'macOS Dock',
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(),
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: Get.find<ThemeController>().themeMode.value,
      initialRoute: AppRoutes.home,
      getPages: AppPages.routes,
    );
  }
}
