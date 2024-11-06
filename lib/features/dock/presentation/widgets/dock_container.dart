import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gapopa_flutter_vedant/features/dock/data/models/dock_item.dart';
import 'package:gapopa_flutter_vedant/features/dock/presentation/widgets/dock_item_widget.dart';
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
        iconPath: 'assets/icons/finder.png',
        label: 'Finder',
        onTap: () => _launchApp('Finder'),
      ),
      DockItem(
        id: 'item2',
        iconPath:
            'assets/icons/taskmanager.png', // Add appropriate icon path for Task Manager
        label: 'Task Manager',
        onTap: () => _launchApp('Task Manager'),
      ),
      DockItem(
        id: 'item3',
        iconPath:
            'assets/icons/terminal.png', // Add appropriate icon path for Terminal
        label: 'Terminal',
        onTap: () => _launchApp('Terminal'),
      ),
      DockItem(
        id: 'item4',
        iconPath:
            'assets/icons/email.png', // Add appropriate icon path for Email
        label: 'Email',
        onTap: () => _launchApp('Email'),
      ),
      DockItem(
        id: 'item5',
        iconPath: 'assets/icons/messages.png',
        label: 'Messaging',
        onTap: () => _launchApp('Messaging'),
      ),
      DockItem(
        id: 'item6',
        iconPath: 'assets/icons/calendar.png',
        label: 'Calendar',
        onTap: () => _launchApp('Calendar'),
      ),
      DockItem(
        id: 'item7',
        iconPath: 'assets/icons/notes.png',
        label: 'Notes',
        onTap: () => _launchApp('Notes'),
      ),
      DockItem(
        id: 'item8',
        iconPath: 'assets/icons/music.png',
        label: 'Music',
        onTap: () => _launchApp('Music'),
      ),
      DockItem(
        id: 'item9',
        iconPath: 'assets/icons/reminders.png',
        label: 'Reminder',
        onTap: () => _launchApp('Reminder'),
      ),
      DockItem(
        id: 'item10',
        iconPath: 'assets/icons/safari.png',
        label: 'Safari',
        onTap: () => _launchApp('Safari'),
      ),
      DockItem(
        id: 'item11',
        iconPath: 'assets/icons/folder.png',
        label: 'Folder',
        onTap: () => _launchApp('Folder'),
      ),
      DockItem(
        id: 'item12',
        iconPath: 'assets/icons/facetime.png',
        label: 'FaceTime',
        onTap: () => _launchApp('FaceTime'),
      ),
      DockItem(
        id: 'item13',
        iconPath: 'assets/icons/settings.png',
        label: 'Settings',
        onTap: () => _launchApp('Settings'),
      ),
      // Add more dock items here as needed
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

  void _launchApp(String appName) {
    if (appName == 'Settings') {
      Get.toNamed('/settings');
      return;
    }
    // Implement app launching logic here
    log('Launching app: $appName');
  }
}

class DockContainer extends StatefulWidget {
  const DockContainer({super.key});

  @override
  State<DockContainer> createState() => _DockContainerState();
}

class _DockContainerState extends State<DockContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final DockController controller = Get.put(DockController());

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Obx(() => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < controller.items.length; i++)
                    DockItemWidget(
                      key: ValueKey(controller.items[i].id),
                      item: controller.items[i],
                      index: i,
                      onDragStart: (details) {
                        controller.updateDragPosition(
                            i, details.globalPosition);
                        _animationController.forward();
                      },
                      onDragUpdate: (details) {
                        controller.dragOffset.value = details.globalPosition;
                      },
                      onDragEnd: (details) {
                        final newIndex = _calculateNewIndex(details.offset);
                        controller.reorderItem(i, newIndex);
                        _animationController.reverse();
                      },
                      onPressed: controller.items[i].onTap,
                    ),
                ],
              )),
        ),
      ),
    );
  }

  int _calculateNewIndex(Offset offset) {
    // Implementation of index calculation based on drag position
    final RenderBox box = context.findRenderObject() as RenderBox;
    final localOffset = box.globalToLocal(offset);
    return (localOffset.dx ~/ 60).clamp(0, controller.items.length - 1);
  }
}
