import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  Offset? mousePosition;

  final double baseItemHeight = 48;
  final double verticalItemsPadding = 10;

  void _onHover(PointerHoverEvent event) {
    setState(() {
      mousePosition = event.localPosition;
    });
  }

  double getIconScale(int index) {
    if (hoveredIndex == null) return 1.0;

    final distance = (index - hoveredIndex!).abs();

    // Scaling configuration for different neighbors
    const double maxScale = 1.75; // Largest scale for hovered icon
    const double neighborScale = 1.43; // Scale for direct neighbors
    const double secondNeighborScale = 1.28; // Scale for second neighbors
    const double scaleDecay = 1.0; // Normal scale for other icons

    // Apply scale based on the distance from the hovered icon
    if (distance == 0) {
      return maxScale; // Hovered icon
    } else if (distance == 1) {
      return neighborScale; // Immediate neighbors
    } else if (distance == 2) {
      return secondNeighborScale; // Second neighbors
    } else {
      return scaleDecay; // Icons further away
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
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: MouseRegion(
            onHover: _onHover,
            onExit: (_) => setState(() => hoveredIndex = null),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                controller.items.length,
                (index) => MouseRegion(
                  onEnter: (_) => setState(() => hoveredIndex = index),
                  onExit: (_) => setState(() => hoveredIndex = null),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 270),
                    height: baseItemHeight * getIconScale(index),
                    width: baseItemHeight * getIconScale(index),
                    margin: const EdgeInsets.symmetric(horizontal: 2),
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
              ),
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
