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
  final double baseItemHeight = 40;
  final double maxItemHeight = 63; // Reduce maximum height to prevent overflow
  final double baseTranslationY = 0.0;
  final double maxTranslationY =
      -10; // Adjust translation to reduce dock movement
  final double verticalItemsPadding = 10;

  double getScaledSize(int index) {
    return getPropertyValue(
      index: index,
      baseValue: baseItemHeight,
      maxValue: maxItemHeight, // Set a new capped max height
      nonHoveredMaxValue: 40,
    );
  }

  double getTranslationY(int index) {
    return getPropertyValue(
      index: index,
      baseValue: baseTranslationY,
      maxValue: maxTranslationY, // Use smaller translation for stability
      nonHoveredMaxValue:
          -8, // Use a smaller value here too for smoother transitions
    );
  }

  double getPropertyValue({
    required int index,
    required double baseValue,
    required double maxValue,
    required double nonHoveredMaxValue,
  }) {
    if (hoveredIndex == null) {
      return baseValue;
    }

    final difference = (hoveredIndex! - index).abs();
    final itemsAffected = controller.items.length;

    if (difference == 0) {
      return maxValue;
    } else if (difference <= itemsAffected) {
      final ratio = (itemsAffected - difference) / itemsAffected;
      return lerpDouble(baseValue, nonHoveredMaxValue, ratio)!;
    } else {
      return baseValue;
    }
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
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              controller.items.length,
              (index) {
                return MouseRegion(
                  cursor: SystemMouseCursors.click,
                  onEnter: (event) => setState(() {
                    hoveredIndex = index;
                  }),
                  onExit: (event) => setState(() {
                    hoveredIndex = null;
                  }),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: getScaledSize(index),
                    width: getScaledSize(index),
                    transform: Matrix4.identity()
                      ..translate(0.0, getTranslationY(index)),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    child: OverflowBox(
                      alignment: Alignment.center,
                      maxHeight:
                          maxItemHeight, // Allow the box to expand without cutting off
                      maxWidth: maxItemHeight,
                      child: DockItemWidget(
                        key: ValueKey(controller.items[index].id),
                        item: controller.items[index],
                        index: index,
                        onPressed: controller.items[index].onTap,
                        onDragStart: (details) {
                          controller.updateDragPosition(
                              index, details.globalPosition);
                        },
                        onDragUpdate: (details) {
                          controller.dragOffset.value = details.globalPosition;
                        },
                        onDragEnd: (details) {
                          final newIndex = _calculateNewIndex(details.offset);
                          controller.reorderItem(index, newIndex);
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  int _calculateNewIndex(Offset offset) {
    final RenderBox box = context.findRenderObject() as RenderBox;
    final localOffset = box.globalToLocal(offset);
    return (localOffset.dx ~/ 60).clamp(0, controller.items.length - 1);
  }
}
