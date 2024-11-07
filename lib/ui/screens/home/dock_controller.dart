import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gapopa_flutter_vedant/shared/constants/all_dock_items.dart';
import 'package:gapopa_flutter_vedant/ui/screens/app_window/app_window_screen.dart';
import 'package:gapopa_flutter_vedant/data/models/dock_item.dart';
import 'package:gapopa_flutter_vedant/ui/screens/settings/settings_window.dart';
import 'package:get/get.dart';

class DockController extends GetxController {
  final RxList<DockItem> items = <DockItem>[].obs; // Items in the dock
  final RxList<DockItem> notAddedItems =
      <DockItem>[].obs; // Items not added to the dock
  final RxInt draggedIndex = (-1).obs;
  final Rx<Offset> dragOffset = const Offset(0, 0).obs;
  final RxList<Widget> windows = <Widget>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadInitialItems();
    _loadInitialWindows();
    _initializeNotAddedItems();
  }

  // Load initial items into the dock
  void _loadInitialItems() {
    items.addAll(initialItems);
  }

  void _initializeNotAddedItems() {
    // Assuming allDockItems is the list containing all the items available
    notAddedItems.addAll(
      allDockItems.where((item) => !initialItems.contains(item)).toList(),
    );
  }

  void _loadInitialWindows() {
    windows.addAll([
      AppWindowScreen(
        app: 'Welcome',
        initContent: true,
        onClose: () {
          windows.removeWhere(
              (window) => window is AppWindowScreen && window.app == 'Welcome');
          log('Closed window: Welcome');
        },
      ),
    ]);
  }

  void updateDragPosition(int index, Offset offset) {
    draggedIndex.value = index;
    dragOffset.value = offset;
  }

  void reorderItem(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final item = items.removeAt(oldIndex);
    items.insert(newIndex, item);
  }

  void launchApp(String appName) {
    if (appName == 'Settings') {
      // Open Settings as a window-like screen (similar to AppWindowScreen)
      final newSettingsWindow = SettingsWindow(
        app: 'Settings',
        onClose: () {
          // Remove the window from the windows list when the close button is pressed
          windows.removeWhere(
            (window) => window is SettingsWindow && window.app == 'Settings',
          );
          log('Closed window: Settings');
        },
      );
      windows.add(newSettingsWindow);

      return;
    }
    // Implement transition animation for opening a new screen

    final newWindow = AppWindowScreen(
      app: appName,
      onClose: () {
        // Remove the window from the windows list when the close button is pressed
        windows.removeWhere(
            (window) => window is AppWindowScreen && window.app == appName);
        log('Closed window: $appName');
      },
    );
    windows.add(newWindow);

    log('Launching app: $appName');
  }

  // Function to add an item to the dock
  void addItemToDock(DockItem item) {
    if (!items.contains(item)) {
      items.add(item);
      notAddedItems.remove(item); // Remove from not added items
    }
  }

  // Function to remove an item from the dock
  void removeItemFromDock(DockItem item) {
    if (items.contains(item)) {
      items.remove(item);
      notAddedItems.add(item); // Add back to not added items
    }
  }
}
