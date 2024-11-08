import 'package:flutter/material.dart';
import 'package:gapopa_flutter_vedant/shared/constants/all_dock_items.dart';
import 'package:gapopa_flutter_vedant/shared/constants/init_window_content.dart';

class AppWindowScreen extends StatefulWidget {
  final String app;
  final VoidCallback onClose;
  final bool initContent;
  final Offset initialPosition;

  const AppWindowScreen({
    super.key,
    required this.app,
    required this.onClose,
    required this.initialPosition,
    this.initContent = false,
  });

  @override
  AppWindowScreenState createState() => AppWindowScreenState();
}

class AppWindowScreenState extends State<AppWindowScreen> {
  late Offset _position; // Initial position of the window
  Offset _dragStartPosition = Offset.zero; // Where the drag starts
  Offset _dragOffset = Offset.zero; // The offset of the drag

  @override
  void initState() {
    super.initState();
    _position =
        widget.initialPosition; // Set the initial position from the widget
  }

  // Update position when dragging
  void _onPanStart(DragStartDetails details) {
    setState(() {
      _dragStartPosition = details.localPosition;
    });
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _dragOffset = details.localPosition - _dragStartPosition;
      _position = _position + _dragOffset; // Update the window position
      _dragStartPosition =
          details.localPosition; // Set new start position for next update
    });
  }

  void _onPanEnd(DragEndDetails details) {
    // Reset the drag offset after the drag ends
    setState(() {
      _dragOffset = Offset.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _position.dx,
      top: _position.dy,
      child: GestureDetector(
        onPanStart: _onPanStart,
        onPanUpdate: _onPanUpdate,
        onPanEnd: _onPanEnd,
        child: Material(
          color: Colors.transparent,
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
                        onTap: widget
                            .onClose, // Call the onClose callback when tapped
                        child: CircleAvatar(
                          radius: 6,
                          backgroundColor: Colors.red,
                        ),
                      ),
                      const SizedBox(width: 8),
                      CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.yellow,
                      ),
                      const SizedBox(width: 8),
                      CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.green,
                      ),
                      SizedBox(width: 213),
                      Text(
                        widget.app,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                      child: widget.initContent == false
                          ? Image.asset(
                              allDockItems
                                  .firstWhere(
                                      (item) => item.label == widget.app)
                                  .iconPath,
                              width: 80,
                            )
                          : InitWindowContent()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
