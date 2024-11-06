import 'package:flutter/material.dart';
import 'package:gapopa_flutter_vedant/features/dock/data/models/dock_item.dart';
import 'package:gapopa_flutter_vedant/features/dock/presentation/widgets/dock_magnification_effect.dart';

class DockItemWidget extends StatelessWidget {
  final DockItem item;
  final int index;
  final VoidCallback? onPressed;
  final Function(DragStartDetails) onDragStart;
  final Function(DragUpdateDetails) onDragUpdate;
  final Function(DraggableDetails) onDragEnd; // Updated type here

  const DockItemWidget({
    super.key,
    required this.item,
    required this.index,
    required this.onDragStart,
    required this.onDragUpdate,
    required this.onDragEnd,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Draggable<DockItem>(
      data: item,
      feedback: DockMagnificationEffect(
        child: _buildIcon(scale: 1.2),
      ),
      childWhenDragging: DockMagnificationEffect(
        child: _buildIcon(opacity: 0.5),
      ),
      onDragStarted: () => onDragStart,
      onDragUpdate: onDragUpdate,
      onDragEnd: (details) => onDragEnd(details),
      child: DockMagnificationEffect(
        child: _buildIcon(),
      ), // No change in this part
    );
  }

  Widget _buildIcon({double scale = 1.0, double opacity = 1.0}) {
    return AnimatedScale(
      scale: scale,
      duration: const Duration(milliseconds: 200),
      child: Opacity(
        opacity: opacity,
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            width: 48,
            height: 48,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(item.iconPath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
