import 'package:gapopa_flutter_vedant/data/models/dock_item.dart';
import 'package:gapopa_flutter_vedant/shared/constants/app_images.dart';
import 'package:gapopa_flutter_vedant/ui/screens/app_window/app_window_controller.dart';
import 'package:get/get.dart';

final appWindowController = Get.find<AppWindowController>();

final allDockItems = [
  DockItem(
    id: 'item1',
    iconPath: ImageConstants.finderIcon,
    label: 'Finder',
    onTap: () => appWindowController.launchApp('Finder'),
  ),
  DockItem(
    id: 'item2',
    iconPath: ImageConstants.taskManagerIcon,
    label: 'Task Manager',
    onTap: () => appWindowController.launchApp('Task Manager'),
  ),
  DockItem(
    id: 'item3',
    iconPath: ImageConstants.terminalIcon,
    label: 'Terminal',
    onTap: () => appWindowController.launchApp('Terminal'),
  ),
  DockItem(
    id: 'item4',
    iconPath: ImageConstants.emailIcon,
    label: 'Email',
    onTap: () => appWindowController.launchApp('Email'),
  ),
  DockItem(
    id: 'item5',
    iconPath: ImageConstants.messagesIcon,
    label: 'Messaging',
    onTap: () => appWindowController.launchApp('Messaging'),
  ),
  DockItem(
    id: 'item6',
    iconPath: ImageConstants.calendarIcon,
    label: 'Calendar',
    onTap: () => appWindowController.launchApp('Calendar'),
  ),
  DockItem(
    id: 'item7',
    iconPath: ImageConstants.notesIcon,
    label: 'Notes',
    onTap: () => appWindowController.launchApp('Notes'),
  ),
  DockItem(
    id: 'item8',
    iconPath: ImageConstants.musicIcon,
    label: 'Music',
    onTap: () => appWindowController.launchApp('Music'),
  ),
  DockItem(
    id: 'item9',
    iconPath: ImageConstants.remindersIcon,
    label: 'Reminder',
    onTap: () => appWindowController.launchApp('Reminder'),
  ),
  DockItem(
    id: 'item10',
    iconPath: ImageConstants.safariIcon,
    label: 'Safari',
    onTap: () => appWindowController.launchApp('Safari'),
  ),
  DockItem(
    id: 'item11',
    iconPath: ImageConstants.folderIcon,
    label: 'Folder',
    onTap: () => appWindowController.launchApp('Folder'),
  ),
  DockItem(
    id: 'item12',
    iconPath: ImageConstants.facetimeIcon,
    label: 'FaceTime',
    onTap: () => appWindowController.launchApp('FaceTime'),
  ),
  DockItem(
    id: 'item13',
    iconPath: ImageConstants.settingsIcon,
    label: 'Settings',
    onTap: () => appWindowController.launchApp('Settings'),
  ),
  DockItem(
    id: 'item14',
    iconPath: ImageConstants.booksIcon,
    label: 'Books',
    onTap: () => appWindowController.launchApp('Books'),
  ),
  DockItem(
    id: 'item15',
    iconPath: ImageConstants.calculatorIcon,
    label: 'Calculator',
    onTap: () => appWindowController.launchApp('Calculator'),
  ),
  DockItem(
    id: 'item16',
    iconPath: ImageConstants.findMyIcon,
    label: 'Find My',
    onTap: () => appWindowController.launchApp('Find My'),
  ),
  DockItem(
    id: 'item17',
    iconPath: ImageConstants.pagesIcon,
    label: 'Pages',
    onTap: () => appWindowController.launchApp('Pages'),
  ),
  DockItem(
    id: 'item18',
    iconPath: ImageConstants.photosIcon,
    label: 'Photos',
    onTap: () => appWindowController.launchApp('Photos'),
  ),
  DockItem(
    id: 'item19',
    iconPath: ImageConstants.podcastsIcon,
    label: 'Podcasts',
    onTap: () => appWindowController.launchApp('Podcasts'),
  ),
  DockItem(
    id: 'item20',
    iconPath: ImageConstants.timemachineIcon,
    label: 'Time Machine',
    onTap: () => appWindowController.launchApp('Time Machine'),
  ),
];

final initialItems = [
  DockItem(
    id: 'item1',
    iconPath: ImageConstants.finderIcon,
    label: 'Finder',
    onTap: () => appWindowController.launchApp('Finder'),
  ),
  DockItem(
    id: 'item2',
    iconPath: ImageConstants.taskManagerIcon,
    label: 'Task Manager',
    onTap: () => appWindowController.launchApp('Task Manager'),
  ),
  DockItem(
    id: 'item3',
    iconPath: ImageConstants.terminalIcon,
    label: 'Terminal',
    onTap: () => appWindowController.launchApp('Terminal'),
  ),
  DockItem(
    id: 'item4',
    iconPath: ImageConstants.emailIcon,
    label: 'Email',
    onTap: () => appWindowController.launchApp('Email'),
  ),
  DockItem(
    id: 'item5',
    iconPath: ImageConstants.messagesIcon,
    label: 'Messaging',
    onTap: () => appWindowController.launchApp('Messaging'),
  ),
  DockItem(
    id: 'item6',
    iconPath: ImageConstants.calendarIcon,
    label: 'Calendar',
    onTap: () => appWindowController.launchApp('Calendar'),
  ),
  DockItem(
    id: 'item7',
    iconPath: ImageConstants.notesIcon,
    label: 'Notes',
    onTap: () => appWindowController.launchApp('Notes'),
  ),
  DockItem(
    id: 'item8',
    iconPath: ImageConstants.musicIcon,
    label: 'Music',
    onTap: () => appWindowController.launchApp('Music'),
  ),
  DockItem(
    id: 'item9',
    iconPath: ImageConstants.remindersIcon,
    label: 'Reminder',
    onTap: () => appWindowController.launchApp('Reminder'),
  ),
  DockItem(
    id: 'item10',
    iconPath: ImageConstants.safariIcon,
    label: 'Safari',
    onTap: () => appWindowController.launchApp('Safari'),
  ),
  DockItem(
    id: 'item11',
    iconPath: ImageConstants.folderIcon,
    label: 'Folder',
    onTap: () => appWindowController.launchApp('Folder'),
  ),
  DockItem(
    id: 'item12',
    iconPath: ImageConstants.facetimeIcon,
    label: 'FaceTime',
    onTap: () => appWindowController.launchApp('FaceTime'),
  ),
  DockItem(
    id: 'item13',
    iconPath: ImageConstants.settingsIcon,
    label: 'Settings',
    onTap: () => appWindowController.launchApp('Settings'),
  ),
];

Map<String, DockItem> dockItemsMap = {
  'Finder': DockItem(
    id: 'item1',
    iconPath: ImageConstants.finderIcon,
    label: 'Finder',
    onTap: () => appWindowController.launchApp('Finder'),
  ),
  'Task Manager': DockItem(
    id: 'item2',
    iconPath: ImageConstants.taskManagerIcon,
    label: 'Task Manager',
    onTap: () => appWindowController.launchApp('Task Manager'),
  ),
  'Terminal': DockItem(
    id: 'item3',
    iconPath: ImageConstants.terminalIcon,
    label: 'Terminal',
    onTap: () => appWindowController.launchApp('Terminal'),
  ),
  'Email': DockItem(
    id: 'item4',
    iconPath: ImageConstants.emailIcon,
    label: 'Email',
    onTap: () => appWindowController.launchApp('Email'),
  ),
  'Messaging': DockItem(
    id: 'item5',
    iconPath: ImageConstants.messagesIcon,
    label: 'Messaging',
    onTap: () => appWindowController.launchApp('Messaging'),
  ),
  'Calendar': DockItem(
    id: 'item6',
    iconPath: ImageConstants.calendarIcon,
    label: 'Calendar',
    onTap: () => appWindowController.launchApp('Calendar'),
  ),
  'Notes': DockItem(
    id: 'item7',
    iconPath: ImageConstants.notesIcon,
    label: 'Notes',
    onTap: () => appWindowController.launchApp('Notes'),
  ),
  'Music': DockItem(
    id: 'item8',
    iconPath: ImageConstants.musicIcon,
    label: 'Music',
    onTap: () => appWindowController.launchApp('Music'),
  ),
  'Reminder': DockItem(
    id: 'item9',
    iconPath: ImageConstants.remindersIcon,
    label: 'Reminder',
    onTap: () => appWindowController.launchApp('Reminder'),
  ),
  'Safari': DockItem(
    id: 'item10',
    iconPath: ImageConstants.safariIcon,
    label: 'Safari',
    onTap: () => appWindowController.launchApp('Safari'),
  ),
  'Folder': DockItem(
    id: 'item11',
    iconPath: ImageConstants.folderIcon,
    label: 'Folder',
    onTap: () => appWindowController.launchApp('Folder'),
  ),
  'FaceTime': DockItem(
    id: 'item12',
    iconPath: ImageConstants.facetimeIcon,
    label: 'FaceTime',
    onTap: () => appWindowController.launchApp('FaceTime'),
  ),
  'Settings': DockItem(
    id: 'item13',
    iconPath: ImageConstants.settingsIcon,
    label: 'Settings',
    onTap: () => appWindowController.launchApp('Settings'),
  ),
  'Books': DockItem(
    id: 'item14',
    iconPath: ImageConstants.booksIcon,
    label: 'Books',
    onTap: () => appWindowController.launchApp('Books'),
  ),
  'Calculator': DockItem(
    id: 'item15',
    iconPath: ImageConstants.calculatorIcon,
    label: 'Calculator',
    onTap: () => appWindowController.launchApp('Calculator'),
  ),
  'Find My': DockItem(
    id: 'item16',
    iconPath: ImageConstants.findMyIcon,
    label: 'Find My',
    onTap: () => appWindowController.launchApp('Find My'),
  ),
  'Pages': DockItem(
    id: 'item17',
    iconPath: ImageConstants.pagesIcon,
    label: 'Pages',
    onTap: () => appWindowController.launchApp('Pages'),
  ),
  'Photos': DockItem(
    id: 'item18',
    iconPath: ImageConstants.photosIcon,
    label: 'Photos',
    onTap: () => appWindowController.launchApp('Photos'),
  ),
  'Podcasts': DockItem(
    id: 'item19',
    iconPath: ImageConstants.podcastsIcon,
    label: 'Podcasts',
    onTap: () => appWindowController.launchApp('Podcasts'),
  ),
  'Time Machine': DockItem(
    id: 'item20',
    iconPath: ImageConstants.timemachineIcon,
    label: 'Time Machine',
    onTap: () => appWindowController.launchApp('Time Machine'),
  ),
};
