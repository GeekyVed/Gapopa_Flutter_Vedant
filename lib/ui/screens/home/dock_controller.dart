import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gapopa_flutter_vedant/ui/screens/app_window/app_window_screen.dart';
import 'package:gapopa_flutter_vedant/data/models/dock_item.dart';
import 'package:gapopa_flutter_vedant/shared/constants/app_images.dart';
import 'package:get/get.dart';

class DockController extends GetxController {
  final RxList<DockItem> items = <DockItem>[].obs;
  final RxInt draggedIndex = (-1).obs;
  final Rx<Offset> dragOffset = const Offset(0, 0).obs;

  @override
  void onInit() {
    super.onInit();
    _loadInitialItems();
  }

  void _loadInitialItems() {
    items.addAll([
      DockItem(
        id: 'item1',
        iconPath: ImageConstants.finderIcon,
        label: 'Finder',
        onTap: () => launchApp('Finder'),
      ),
      DockItem(
        id: 'item2',
        iconPath: ImageConstants.taskManagerIcon,
        label: 'Task Manager',
        onTap: () => launchApp('Task Manager'),
      ),
      DockItem(
        id: 'item3',
        iconPath: ImageConstants.terminalIcon,
        label: 'Terminal',
        onTap: () => launchApp('Terminal'),
      ),
      DockItem(
        id: 'item4',
        iconPath: ImageConstants.emailIcon,
        label: 'Email',
        onTap: () => launchApp('Email'),
      ),
      DockItem(
        id: 'item5',
        iconPath: ImageConstants.messagesIcon,
        label: 'Messaging',
        onTap: () => launchApp('Messaging'),
      ),
      DockItem(
        id: 'item6',
        iconPath: ImageConstants.calendarIcon,
        label: 'Calendar',
        onTap: () => launchApp('Calendar'),
      ),
      DockItem(
        id: 'item7',
        iconPath: ImageConstants.notesIcon,
        label: 'Notes',
        onTap: () => launchApp('Notes'),
      ),
      DockItem(
        id: 'item8',
        iconPath: ImageConstants.musicIcon,
        label: 'Music',
        onTap: () => launchApp('Music'),
      ),
      DockItem(
        id: 'item9',
        iconPath: ImageConstants.remindersIcon,
        label: 'Reminder',
        onTap: () => launchApp('Reminder'),
      ),
      DockItem(
        id: 'item10',
        iconPath: ImageConstants.safariIcon,
        label: 'Safari',
        onTap: () => launchApp('Safari'),
      ),
      DockItem(
        id: 'item11',
        iconPath: ImageConstants.folderIcon,
        label: 'Folder',
        onTap: () => launchApp('Folder'),
      ),
      DockItem(
        id: 'item12',
        iconPath: ImageConstants.facetimeIcon,
        label: 'FaceTime',
        onTap: () => launchApp('FaceTime'),
      ),
      DockItem(
        id: 'item13',
        iconPath: ImageConstants.settingsIcon,
        label: 'Settings',
        onTap: () => launchApp('Settings'),
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
      Get.toNamed('/settings');
      return;
    }
    // Implement transition animation for opening a new screen

    Get.to(
        () => AppWindowScreen(
              app: appName,
            ),
        transition: Transition.fadeIn,
        duration: Duration(milliseconds: 300));

    log('Launching app: $appName');
  }
}
