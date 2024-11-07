import 'package:gapopa_flutter_vedant/data/models/dock_item.dart';
import 'package:gapopa_flutter_vedant/shared/constants/app_images.dart';
import 'package:gapopa_flutter_vedant/ui/screens/home/dock_controller.dart';
import 'package:get/get.dart';

final dockController = Get.find<DockController>();

final allDockItems = [
  DockItem(
    id: 'item1',
    iconPath: ImageConstants.finderIcon,
    label: 'Finder',
    onTap: () => dockController.launchApp('Finder'),
  ),
  DockItem(
    id: 'item2',
    iconPath: ImageConstants.taskManagerIcon,
    label: 'Task Manager',
    onTap: () => dockController.launchApp('Task Manager'),
  ),
  DockItem(
    id: 'item3',
    iconPath: ImageConstants.terminalIcon,
    label: 'Terminal',
    onTap: () => dockController.launchApp('Terminal'),
  ),
  DockItem(
    id: 'item4',
    iconPath: ImageConstants.emailIcon,
    label: 'Email',
    onTap: () => dockController.launchApp('Email'),
  ),
  DockItem(
    id: 'item5',
    iconPath: ImageConstants.messagesIcon,
    label: 'Messaging',
    onTap: () => dockController.launchApp('Messaging'),
  ),
  DockItem(
    id: 'item6',
    iconPath: ImageConstants.calendarIcon,
    label: 'Calendar',
    onTap: () => dockController.launchApp('Calendar'),
  ),
  DockItem(
    id: 'item7',
    iconPath: ImageConstants.notesIcon,
    label: 'Notes',
    onTap: () => dockController.launchApp('Notes'),
  ),
  DockItem(
    id: 'item8',
    iconPath: ImageConstants.musicIcon,
    label: 'Music',
    onTap: () => dockController.launchApp('Music'),
  ),
  DockItem(
    id: 'item9',
    iconPath: ImageConstants.remindersIcon,
    label: 'Reminder',
    onTap: () => dockController.launchApp('Reminder'),
  ),
  DockItem(
    id: 'item10',
    iconPath: ImageConstants.safariIcon,
    label: 'Safari',
    onTap: () => dockController.launchApp('Safari'),
  ),
  DockItem(
    id: 'item11',
    iconPath: ImageConstants.folderIcon,
    label: 'Folder',
    onTap: () => dockController.launchApp('Folder'),
  ),
  DockItem(
    id: 'item12',
    iconPath: ImageConstants.facetimeIcon,
    label: 'FaceTime',
    onTap: () => dockController.launchApp('FaceTime'),
  ),
  DockItem(
    id: 'item13',
    iconPath: ImageConstants.settingsIcon,
    label: 'Settings',
    onTap: () => dockController.launchApp('Settings'),
  ),
  DockItem(
    id: 'item14',
    iconPath: 'assets/images/apple_music.png',
    label: 'Apple Music',
    onTap: () => dockController.launchApp('Apple Music'),
  ),
  DockItem(
    id: 'item15',
    iconPath: 'assets/images/books.png',
    label: 'Books',
    onTap: () => dockController.launchApp('Books'),
  ),
  DockItem(
    id: 'item16',
    iconPath: 'assets/images/calculator.png',
    label: 'Calculator',
    onTap: () => dockController.launchApp('Calculator'),
  ),
  DockItem(
    id: 'item17',
    iconPath: 'assets/images/calendar.png',
    label: 'Calendar',
    onTap: () => dockController.launchApp('Calendar'),
  ),
  DockItem(
    id: 'item18',
    iconPath: 'assets/images/find_my.png',
    label: 'Find My',
    onTap: () => dockController.launchApp('Find My'),
  ),
  DockItem(
    id: 'item19',
    iconPath: 'assets/images/notes.png',
    label: 'Notes',
    onTap: () => dockController.launchApp('Notes'),
  ),
  DockItem(
    id: 'item20',
    iconPath: 'assets/images/pages.png',
    label: 'Pages',
    onTap: () => dockController.launchApp('Pages'),
  ),
  DockItem(
    id: 'item21',
    iconPath: 'assets/images/photos.png',
    label: 'Photos',
    onTap: () => dockController.launchApp('Photos'),
  ),
  DockItem(
    id: 'item22',
    iconPath: 'assets/images/podcasts.png',
    label: 'Podcasts',
    onTap: () => dockController.launchApp('Podcasts'),
  ),
  DockItem(
    id: 'item23',
    iconPath: 'assets/images/timemachine.png',
    label: 'Time Machine',
    onTap: () => dockController.launchApp('Time Machine'),
  ),
];
