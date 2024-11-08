import 'package:flutter/material.dart';
import 'package:gapopa_flutter_vedant/shared/constants/all_dock_items.dart';
import 'package:gapopa_flutter_vedant/data/models/dock_item.dart';
import 'package:get/get.dart';

class DockController extends GetxController {
  final RxList<DockItem> items = <DockItem>[].obs; // Items in the dock
  final RxList<DockItem> notAddedItems =
      <DockItem>[].obs; // Items not added to the dock
  final RxInt draggedIndex = (-1).obs;
  final Rx<Offset> dragOffset = const Offset(0, 0).obs;

  @override
  void onInit() {
    super.onInit();
    _loadInitialItems();
    _initializeNotAddedItems();
  }

  // Load initial items into the dock
  void _loadInitialItems() {
    items.addAll(initialItems);
  }

  void _initializeNotAddedItems() {
    notAddedItems.addAll(
      allDockItems.where((item) => !initialItems.contains(item)).toList(),
    );
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

  void addItemToDock(DockItem item) {
    if (!items.contains(item)) {
      items.add(item);
      notAddedItems.remove(item); // Remove from not added items
    }
  }

  void removeItemFromDock(DockItem item) {
    if (items.contains(item)) {
      items.remove(item);
      notAddedItems.add(item); // Add back to not added items
    }
  }
}
