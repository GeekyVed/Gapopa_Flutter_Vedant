import 'package:flutter/material.dart';

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
  ];

  int? draggedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 100,
              margin: EdgeInsets.only(bottom: 20),
              child: Center(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  width: _calculateDockWidth(),
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
    );
  }

  double _calculateDockWidth() {
    double baseWidth = dockIcons.length * 50.0;
    if (draggedIndex != null) {
      baseWidth -= 50.0; // Reduce width by one icon's worth when dragging
    }
    return baseWidth + 24.0; // Add padding
  }

  Widget _buildDockIcon(int index) {
    bool isDragging = draggedIndex == index;

    return AnimatedPositioned(
      duration: Duration(milliseconds: 200),
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
            size: 60,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
        childWhenDragging: Container(),
        child: Icon(
          dockIcons[index],
          size: 50,
          color: Colors.white,
        ),
      ),
    );
  }

  double _calculateIconPosition(int index) {
    if (draggedIndex == null) {
      // Default position when not dragging
      return index * 50.0;
    }

    if (index == draggedIndex!) {
      // Position for the dragged icon
      return index * 50.0;
    } else if (index < draggedIndex!) {
      // Position for icons before the dragged one
      return index * 50.0;
    } else {
      // Position for icons after the dragged one
      return (index - 1) * 50.0; // Move left to fill the gap
    }
  }
}
