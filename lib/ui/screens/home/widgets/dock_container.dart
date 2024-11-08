import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gapopa_flutter_vedant/ui/screens/home/dock_controller.dart';
import 'package:gapopa_flutter_vedant/ui/screens/home/widgets/dock_item_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class DockContainer extends StatefulWidget {
  const DockContainer({super.key});

  @override
  State<DockContainer> createState() => _DockContainerState();
}

class _DockContainerState extends State<DockContainer>
    with SingleTickerProviderStateMixin {
  final DockController controller = Get.find();
  int? hoveredIndex;
  int? draggedIndex;
  final double baseItemHeight = 48;

  late AnimationController _shrinkAnimationController;
  int? shrinkingIndex;

  @override
  void initState() {
    super.initState();
    _shrinkAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _shrinkAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.removeItemFromDock(controller.items[shrinkingIndex!]);
        shrinkingIndex = null;
        _shrinkAnimationController.reset();
      }
    });
  }

  @override
  void dispose() {
    _shrinkAnimationController.dispose();
    super.dispose();
  }

  final double hoverScale = 1.75;
  final double neighborScale = 1.43;
  final double secondNeighborScale = 1.28;
  final double normalScale = 1.0;

  bool isDragging = false;
  double dragPositionY = 0.0;

  double getIconScale(int index) {
    if (shrinkingIndex == index) {
      return normalScale * (1 - _shrinkAnimationController.value);
    }

    if (isDragging && index == draggedIndex) {
      return normalScale;
    }
    if (!isDragging && hoveredIndex == null) {
      return normalScale;
    }

    final distance =
        (index - (isDragging ? draggedIndex! : hoveredIndex!)).abs();

    if (distance == 0) {
      return hoverScale;
    } else if (distance == 1) {
      return neighborScale;
    } else if (distance == 2) {
      return secondNeighborScale;
    } else {
      return normalScale;
    }
  }

  void _startShrinkAnimation(int index) {
    setState(() {
      shrinkingIndex = index;
    });
    _shrinkAnimationController.forward();
  }

  Widget _buildLabel(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: GoogleFonts.roboto(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Dock container
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 960),
              decoration: BoxDecoration(
                color:
                    Colors.white.withOpacity(draggedIndex != null ? 0.1 : 0.2),
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
                        feedbackOffset: Offset.zero,
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
                              _startShrinkAnimation(draggedIndex!);
                            }
                            isDragging = false;
                            draggedIndex = null;
                            hoveredIndex = null;
                            dragPositionY = 0.0;
                          });
                        },
                        feedback: Material(
                          color: Colors.transparent,
                          child: _buildDockIcon(index, isDragging: true),
                        ),
                        childWhenDragging: const SizedBox.shrink(),
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
        ),
        // Labels
        if (hoveredIndex != null && !isDragging)
          Positioned(
            left: _calculateLabelPosition(hoveredIndex!),
            bottom: baseItemHeight * getIconScale(hoveredIndex!) +
                10, // Position above the dock
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: hoveredIndex != null ? 1.0 : 0.0,
              child: _buildLabel(controller.items[hoveredIndex!].label),
            ),
          ),
      ],
    );
  }

  double _calculateLabelPosition(int index) {
    // Calculate the position based on the index
    double position = 10.0; // Initial padding
    for (int i = 0; i < index; i++) {
      position += baseItemHeight * getIconScale(i) + 4.0; // Add margin
    }
    // Center the label over the icon
    position +=
        (baseItemHeight * getIconScale(index) - baseItemHeight * normalScale) /
            2;
    return position;
  }

  Widget _buildDockIcon(int index, {bool isDragging = false}) {
    return AnimatedBuilder(
      animation: _shrinkAnimationController,
      builder: (context, child) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 252),
          height: baseItemHeight * getIconScale(index),
          width: baseItemHeight * getIconScale(index),
          margin: const EdgeInsets.symmetric(horizontal: 2),
          child: Opacity(
            opacity: shrinkingIndex == index
                ? 1 - _shrinkAnimationController.value
                : 1.0,
            child: DockItemWidget(
              key: ValueKey(controller.items[index].id),
              item: controller.items[index],
              index: index,
              onPressed: controller.items[index].onTap,
            ),
          ),
        );
      },
    );
  }
}
