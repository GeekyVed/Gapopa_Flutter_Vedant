import 'package:flutter/material.dart';
import 'package:gapopa_flutter_vedant/config/router/app_router.dart';
import 'package:gapopa_flutter_vedant/core/theme/app_theme.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'macOS Dock',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      initialRoute: AppRouter.home,
      getPages: AppRouter.routes,
    );
  }
}
