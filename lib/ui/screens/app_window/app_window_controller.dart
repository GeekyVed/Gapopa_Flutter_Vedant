import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gapopa_flutter_vedant/ui/screens/app_window/app_window_screen.dart';
import 'package:gapopa_flutter_vedant/ui/screens/settings/settings_window.dart';
import 'package:get/get.dart';

class AppWindowController extends GetxController {
  final _position = Offset(100, 100).obs;
  final RxList<Widget> windows = <Widget>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadInitialWindows();
  }

  void _loadInitialWindows() {
    windows.addAll([
      AppWindowScreen(
        app: 'Welcome',
        initContent: true,
        initialPosition: Offset(100, 100),
        onClose: () {
          windows.removeWhere(
              (window) => window is AppWindowScreen && window.app == 'Welcome');
          log('Closed window: Welcome');
        },
      ),
    ]);
  }

  void launchApp(String appName) {
    if (appName == 'Settings') {
      _launchSettingsWindow();
    } else {
      _launchAppWindow(appName);
    }
  }

  void _launchSettingsWindow() {
    final newSettingsWindow = SettingsWindow(
      app: 'Settings',
      onClose: () => _closeWindow(null),
    );
    windows.add(newSettingsWindow);
    log('Launching app: Settings');
  }

  void _launchAppWindow(String appName) {
    final newWindow = AppWindowScreen(
      app: appName,
      initialPosition: _updateWindowPosition(),
      onClose: () => _closeWindow(appName),
    );
    windows.add(newWindow);
    log('Launching app: $appName');
  }

  void _closeWindow(String? appName) {
    if (appName == null) {
      windows.removeWhere(
          (window) => window is SettingsWindow && window.app == 'Settings');
      log('Closed window: Settings');
    } else {
      windows.removeWhere(
          (window) => window is AppWindowScreen && window.app == appName);
      log('Closed window: $appName');
    }
  }

  Offset _updateWindowPosition() {
    final screenSize = Get.size;
    final windowWidth = 600.0;
    final windowHeight = 400.0;

    double x = _position.value.dx + 49;
    double y = _position.value.dy + 49;

    if (x + windowWidth > screenSize.width) {
      x = 100;
    }

    if (y + windowHeight > screenSize.height) {
      y = 100;
    }

    // Check if the windows list is empty
    if (windows.isEmpty) {
      // Reset the position to the original values
      _position.value = Offset(100, 100);
      x = _position.value.dx;
      y = _position.value.dy;
    }

    _position.value = Offset(x, y);
    return _position.value;
  }
}
