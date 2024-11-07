import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'macOS Dock Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: DockAnimationPage(),
    );
  }
}

class DockAnimationPage extends StatefulWidget {
  const DockAnimationPage({super.key});

  @override
  DockAnimationPageState createState() => DockAnimationPageState();
}

class DockAnimationPageState extends State<DockAnimationPage> {
  List<IconData> dockIcons = [
    Icons.home,
    Icons.search,
    Icons.settings,
    Icons.notifications,
    Icons.message,
    Icons.person,
    Icons.folder,
    Icons.music_note,
  ];

  int? draggedIndex;
  Offset? mousePosition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Listener(
        onPointerHover: (PointerHoverEvent event) {
          setState(() {
            mousePosition = event.localPosition;
          });
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 120,
                margin: EdgeInsets.only(bottom: 20),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        for (int i = 0; i < dockIcons.length; i++)
                          _buildDockIcon(i),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDockIcon(int index) {
    bool isDragging = draggedIndex == index;
    double scale = _calculateIconScale(index);

    return AnimatedPositioned(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeOutCubic,
      left: _calculateIconPosition(index),
      top: isDragging ? -40.0 : 0.0,
      child: Draggable<int>(
        data: index,
        onDragStarted: () => setState(() {
          draggedIndex = index;
        }),
        onDragEnd: (details) => setState(() {
          draggedIndex = null;
        }),
        feedback: Material(
          color: Colors.transparent,
          child: Icon(
            dockIcons[index],
            size: 60 * scale,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
        childWhenDragging: SizedBox(
          width: 50 * scale,
        ),
        child: AnimatedScale(
          duration: Duration(milliseconds: 100),
          scale: scale,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                dockIcons[index],
                size: 50,
                color: Colors.white,
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: 4,
                height: 4,
                margin: EdgeInsets.only(top: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDragging ? Colors.blue : Colors.transparent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double _calculateIconScale(int index) {
    if (mousePosition == null) return 1.0;

    final iconPosition = _calculateIconPosition(index);
    final distance = (mousePosition!.dx - (iconPosition + 25)).abs();

    // Maximum scale when mouse is directly over the icon
    const double maxScale = 1.5;
    // Distance at which scaling begins to take effect
    const double scalingDistance = 100.0;

    if (distance > scalingDistance) return 1.0;

    // Calculate scale based on distance
    return 1.0 + (maxScale - 1.0) * (1 - (distance / scalingDistance));
  }

  double _calculateIconPosition(int index) {
    double basePosition = (MediaQuery.of(context).size.width / 2) -
        ((50.0 * dockIcons.length) / 2);

    if (draggedIndex == null) {
      return basePosition + (index * 50.0);
    }

    // Calculate the gap size based on distance from dragged icon
    double gapSize = 30.0;
    int distanceFromDragged = (index - draggedIndex!).abs();

    if (index == draggedIndex!) {
      return basePosition + (index * 50.0);
    } else if (index < draggedIndex!) {
      // Icons to the left move left
      double shift = gapSize * math.max(0, 1 - distanceFromDragged / 3);
      return basePosition + (index * 50.0) - shift;
    } else {
      // Icons to the right move right
      double shift = gapSize * math.max(0, 1 - distanceFromDragged / 3);
      return basePosition + (index * 50.0) + shift;
    }
  }
}
