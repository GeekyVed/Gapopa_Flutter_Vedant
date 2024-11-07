import 'package:flutter/material.dart';
import 'package:gapopa_flutter_vedant/shared/constants/app_images.dart';
import 'package:gapopa_flutter_vedant/data/models/dock_item.dart';

class AppWindowScreen extends StatefulWidget {
  final String app;

  const AppWindowScreen({super.key, required this.app});

  @override
  AppWindowScreenState createState() => AppWindowScreenState();
}

class AppWindowScreenState extends State<AppWindowScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  Offset _position = Offset(100, 100); // initial position for the window

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: Offset(0, -1),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.forward();
  }

  void _closeWindow() {
    _controller.reverse().then((_) => Navigator.of(context).pop());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned(
            left: _position.dx,
            top: _position.dy,
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  _position += details.delta;
                });
              },
              child: SlideTransition(
                position: _animation,
                child: Container(
                  width: 600,
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 10,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Title Bar with close, minimize, maximize buttons
                      Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(24),
                          ),
                        ),
                        child: Row(
                          children: [
                            // macOS style window controls
                            GestureDetector(
                              onTap: _closeWindow,
                              child: CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.red,
                              ),
                            ),
                            const SizedBox(width: 8),
                            CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.yellow,
                            ),
                            const SizedBox(width: 8),
                            CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.green,
                            ),
                            const Spacer(),
                            Text(
                              widget.app,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Image.asset(
                            dockItemsMap[widget.app]!.iconPath,
                            width: 64,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

Map<String, DockItem> dockItemsMap = {
  'Finder': DockItem(
    id: 'item1',
    iconPath: ImageConstants.finderIcon,
    label: 'Finder',
  ),
  'Task Manager': DockItem(
    id: 'item2',
    iconPath: ImageConstants.taskManagerIcon,
    label: 'Task Manager',
  ),
  'Terminal': DockItem(
    id: 'item3',
    iconPath: ImageConstants.terminalIcon,
    label: 'Terminal',
  ),
  'Email': DockItem(
    id: 'item4',
    iconPath: ImageConstants.emailIcon,
    label: 'Email',
  ),
  'Messaging': DockItem(
    id: 'item5',
    iconPath: ImageConstants.messagesIcon,
    label: 'Messaging',
  ),
  'Calendar': DockItem(
    id: 'item6',
    iconPath: ImageConstants.calendarIcon,
    label: 'Calendar',
  ),
  'Notes': DockItem(
    id: 'item7',
    iconPath: ImageConstants.notesIcon,
    label: 'Notes',
  ),
  'Music': DockItem(
    id: 'item8',
    iconPath: ImageConstants.musicIcon,
    label: 'Music',
  ),
  'Reminder': DockItem(
    id: 'item9',
    iconPath: ImageConstants.remindersIcon,
    label: 'Reminder',
  ),
  'Safari': DockItem(
    id: 'item10',
    iconPath: ImageConstants.safariIcon,
    label: 'Safari',
  ),
  'Folder': DockItem(
    id: 'item11',
    iconPath: ImageConstants.folderIcon,
    label: 'Folder',
  ),
  'FaceTime': DockItem(
    id: 'item12',
    iconPath: ImageConstants.facetimeIcon,
    label: 'FaceTime',
  ),
  'Settings': DockItem(
    id: 'item13',
    iconPath: ImageConstants.settingsIcon,
    label: 'Settings',
  ),
};
