import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gapopa_flutter_vedant/ui/screens/home/dock_controller.dart';
import 'package:gapopa_flutter_vedant/ui/screens/home/widgets/dock_item_widget.dart';

class DockContainer extends StatefulWidget {
  const DockContainer({super.key});

  @override
  State<DockContainer> createState() => _DockContainerState();
}

class _DockContainerState extends State<DockContainer> {
  final DockController controller = Get.find();
  int? hoveredIndex;
  int? draggedIndex;
  final double baseItemHeight = 48;

  // Scaling factors for hover, neighbor, second neighbor, and normal icons
  final double hoverScale = 1.75; // Hovered icon will be 2x larger
  final double neighborScale = 1.43; // Immediate neighbors will be 1.6x larger
  final double secondNeighborScale =
      1.28; // Second neighbors will be 1.2x larger
  final double normalScale = 1.0; // Normal size for other icons
  final double dockShrinkScale = 1.0; // Scale for dock during drag

  double dragPositionY = 0.0;

  double getIconScale(int index) {
    if (draggedIndex != null) {
      return dockShrinkScale;
    } else if (hoveredIndex == null) {
      return normalScale;
    }

    final distance = (index - hoveredIndex!).abs();

    if (distance == 0) {
      return hoverScale; // Scaled icon when hovered
    } else if (distance == 1) {
      return neighborScale; // Scaled icons that are immediate neighbors
    } else if (distance == 2) {
      return secondNeighborScale; // Scaled icons that are second neighbors
    } else {
      return normalScale; // Default scale for others
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 960),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                controller.items.length,
                (index) => MouseRegion(
                  onEnter: (_) => setState(() => hoveredIndex = index),
                  onExit: (_) => setState(() => hoveredIndex = null),
                  child: Draggable<int>(
                    data: index,
                    onDragStarted: () => setState(() {
                      draggedIndex = index;
                    }),
                    onDragUpdate: (details) {
                      setState(() {
                        dragPositionY = details.localPosition.dy;
                      });
                    },
                    onDragEnd: (details) {
                      setState(() {
                        if (dragPositionY < 75) {
                          controller.removeItemFromDock(
                              controller.items[draggedIndex!]);
                        }
                        draggedIndex = null;
                        dragPositionY = 0.0;
                      });
                    },
                    feedback: Material(
                      color: Colors.transparent,
                      child: Transform.translate(
                        offset: Offset(0, -40),
                        child: _buildDockIcon(index, isDragging: true),
                      ),
                    ),
                    childWhenDragging: SizedBox.shrink(),
                    child: DragTarget<int>(
                      onAcceptWithDetails: (details) {
                        controller.reorderItem(details.data, index);
                      },
                      onWillAcceptWithDetails: (details) {
                        return details.data != index;
                      },
                      builder: (context, candidateData, rejectedData) {
                        return _buildDockIcon(index);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDockIcon(int index, {bool isDragging = false}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 252),
      height: baseItemHeight * getIconScale(index),
      width: baseItemHeight * getIconScale(index),
      margin: const EdgeInsets.symmetric(horizontal: 2),
      child: DockItemWidget(
        key: ValueKey(controller.items[index].id),
        item: controller.items[index],
        index: index,
        onPressed: controller.items[index].onTap,
      ),
    );
  }
}
